#define _WINSOCK_DEPRECATED_NO_WARNINGS
#include <iostream>
#include <coroutine>
#include <cstdio>
#include <cstring>
#include <winsock2.h> 
#include <ws2tcpip.h>

// Link with Ws2_32.lib automatically
#pragma comment (lib, "Ws2_32.lib")

// PART 0: Static Allocator
// Strategy: Zero Heap Usage. All tasks live in this buffer.
static char task_memory_pool[4096];
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
    // No-op for static strategy (simple bump pointer)
}

// PART 1: Task Definition (Coroutine Handle)
struct Task {
    struct promise_type {
        // CRITICAL: Override 'new' to force storage in static pool
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
    ~Task() { if (handle) handle.destroy(); }

    void resume() { if (handle && !handle.done()) handle.resume(); }
    bool done() const { return !handle || handle.done(); }
};


// PART 2: Real Server Logic
static char recv_buffer[1024];

// Updated Content-Length to match the new longer string
static const char* response_ok =
"HTTP/1.0 200 OK\r\n"
"Content-Type: text/plain\r\n"
"Content-Length: 32\r\n"
"Connection: close\r\n"
"\r\n"
"Hello World! It's working!!!!!!\n";

// Coroutine that handles ONE client connection
Task handle_client(SOCKET client_socket) {
    co_await std::suspend_always{}; // Start task

    std::cout << "[SERVER] Client connected. Reading request...\n";

    // 1. Read from real socket
    int bytes_received = recv(client_socket, recv_buffer, sizeof(recv_buffer) - 1, 0);

    if (bytes_received > 0) {
        recv_buffer[bytes_received] = '\0';
        std::cout << "[SERVER] Received:\n" << recv_buffer << "\n";

        // 2. Simple Parsing (Check if it is GET)
        if (strncmp(recv_buffer, "GET", 3) == 0) {
            std::cout << "[SERVER] GET request detected. Sending response...\n";
            send(client_socket, response_ok, (int)strlen(response_ok), 0);
        }
    }

    // 3. Close connection
    closesocket(client_socket);
    std::cout << "[SERVER] Connection closed.\n";

    co_return;
}


// PART 3: Main Server Loop
int main() {
    // Initialize Winsock
    WSADATA wsaData;
    if (WSAStartup(MAKEWORD(2, 2), &wsaData) != 0) return 1;

    // Create Server Socket
    SOCKET listen_socket = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
    if (listen_socket == INVALID_SOCKET) { WSACleanup(); return 1; }

    // Bind to port 8080
    sockaddr_in server_addr;
    server_addr.sin_family = AF_INET;
    server_addr.sin_addr.s_addr = INADDR_ANY;
    server_addr.sin_port = htons(8080);

    if (bind(listen_socket, (sockaddr*)&server_addr, sizeof(server_addr)) == SOCKET_ERROR) {
        std::cerr << "Bind failed. Port 8080 might be in use.\n";
        closesocket(listen_socket);
        WSACleanup();
        return 1;
    }

    // Listen
    if (listen(listen_socket, SOMAXCONN) == SOCKET_ERROR) return 1;

    std::cout << "--- HTTP Server listening on port 8080 ---\n";
    std::cout << "--- Run 'curl -v http://localhost:8080' to test ---\n";

    // Single-Threaded Loop
    while (true) {
        sockaddr_in client_addr;
        int client_len = sizeof(client_addr);

        // Block until a client connects
        SOCKET client_socket = accept(listen_socket, (sockaddr*)&client_addr, &client_len);

        if (client_socket != INVALID_SOCKET) {
            // Create the coroutine task (Allocates from STATIC pool)
            Task client_task = handle_client(client_socket);

            // Execute the task cooperatively until it finishes
            while (!client_task.done()) {
                client_task.resume();
            }
        }
    }

    closesocket(listen_socket);
    WSACleanup();
    return 0;
}