#define _WINSOCK_DEPRECATED_NO_WARNINGS
#include <iostream>
#include <coroutine>
#include <winsock2.h> 
#include <ws2tcpip.h>

#pragma comment (lib, "Ws2_32.lib")

// Static Allocator: Fixed 64KB buffer to simulate embedded SRAM.
// All coroutine frames and local variables are stored here, avoiding heap usage.
static char task_memory_pool[65536];
static size_t pool_offset = 0;

void* my_static_alloc(size_t size) {
    if (pool_offset + size > sizeof(task_memory_pool)) {
        std::cerr << "[CRITICAL] Out of static memory!\n";
        std::terminate();
    }
    void* ptr = &task_memory_pool[pool_offset];
    pool_offset += size;
    return ptr;
}

void my_static_free(void* ptr, size_t size) {
    // No-op: Bump-pointer allocator does not reclaim memory.
}

// Task Definition: Coroutine handle wrapper
struct Task {
    struct promise_type {
        // Override 'new' to allocate coroutine state in the static pool
        void* operator new(size_t size) { return my_static_alloc(size); }
        void operator delete(void* ptr, size_t size) { my_static_free(ptr, size); }

        Task get_return_object() {
            return Task{ std::coroutine_handle<promise_type>::from_promise(*this) };
        }
        std::suspend_always initial_suspend() { return {}; }
        std::suspend_always final_suspend() noexcept { return {}; }
        void return_void() {}
        void unhandled_exception() { std::terminate(); }
    };

    std::coroutine_handle<promise_type> handle;

    Task(std::coroutine_handle<promise_type> h) : handle(h) {}
    Task() : handle(nullptr) {}

    // Move-only semantics
    Task(Task&& other) noexcept : handle(other.handle) { other.handle = nullptr; }
    Task& operator=(Task&& other) noexcept {
        if (this != &other) {
            if (handle) handle.destroy();
            handle = other.handle;
            other.handle = nullptr;
        }
        return *this;
    }
    ~Task() { if (handle) handle.destroy(); }

    void resume() { if (handle && !handle.done()) handle.resume(); }
    bool done() const { return !handle || handle.done(); }
    bool is_valid() const { return handle != nullptr; }
};

void set_nonblocking(SOCKET s) {
    u_long mode = 1;
    ioctlsocket(s, FIONBIO, &mode);
}

static const char* response_ok =
"HTTP/1.0 200 OK\r\n"
"Content-Type: text/plain\r\n"
"Content-Length: 13\r\n"
"Connection: close\r\n"
"\r\n"
"Hello World!\n";

// Async Coroutine: Handles one client connection
Task handle_client(SOCKET client_socket) {
    set_nonblocking(client_socket);

    // Buffer stored in the static coroutine frame
    char recv_buffer[1024];
    int total_bytes = 0;

    // Loop to accumulate TCP fragments until header is found
    while (true) {
        int bytes = recv(client_socket, recv_buffer + total_bytes,
            sizeof(recv_buffer) - total_bytes - 1, 0);

        if (bytes > 0) {
            total_bytes += bytes;
            recv_buffer[total_bytes] = '\0';

            if (strstr(recv_buffer, "\r\n\r\n")) {
                std::cout << "[SERVER] Full request received.\n";
                break;
            }
        }
        else if (bytes == SOCKET_ERROR) {
            int err = WSAGetLastError();
            // If data is not ready, yield control back to scheduler
            if (err == WSAEWOULDBLOCK) {
                co_await std::suspend_always{};
                continue;
            }
            else {
                break;
            }
        }
        else if (bytes == 0) {
            break;
        }
    }

    if (total_bytes > 0 && strncmp(recv_buffer, "GET", 3) == 0) {
        send(client_socket, response_ok, (int)strlen(response_ok), 0);
    }

    closesocket(client_socket);
    std::cout << "[SERVER] Task finished.\n";
    co_return;
}

#define MAX_CLIENTS 5
static Task active_tasks[MAX_CLIENTS];

int main() {
    WSADATA wsaData;
    WSAStartup(MAKEWORD(2, 2), &wsaData);

    SOCKET listen_socket = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
    set_nonblocking(listen_socket);

    sockaddr_in server_addr = {};
    server_addr.sin_family = AF_INET;
    server_addr.sin_addr.s_addr = INADDR_ANY;
    server_addr.sin_port = htons(8080);

    bind(listen_socket, (sockaddr*)&server_addr, sizeof(server_addr));
    listen(listen_socket, SOMAXCONN);

    std::cout << "--- HTTP Server (Async/Non-Blocking) on 8080 ---\n";

    // Scheduler Loop
    while (true) {
        // Check for new connections
        SOCKET client_socket = accept(listen_socket, nullptr, nullptr);
        if (client_socket != INVALID_SOCKET) {
            bool slot_found = false;
            for (int i = 0; i < MAX_CLIENTS; i++) {
                if (!active_tasks[i].is_valid() || active_tasks[i].done()) {
                    active_tasks[i] = handle_client(client_socket);
                    active_tasks[i].resume(); // Start task
                    std::cout << "[SCHEDULER] New client in slot " << i << "\n";
                    slot_found = true;
                    break;
                }
            }
            if (!slot_found) {
                std::cout << "[SCHEDULER] Server full, dropping connection.\n";
                closesocket(client_socket);
            }
        }

        // Resume existing tasks (Round-Robin)
        for (int i = 0; i < MAX_CLIENTS; i++) {
            if (active_tasks[i].is_valid() && !active_tasks[i].done()) {
                active_tasks[i].resume();
            }
        }

        Sleep(10);
    }

    closesocket(listen_socket);
    WSACleanup();
    return 0;
}