#include <iostream>
#include <coroutine>
#include <cstdio>
#include <cstring>
#include <cstddef>

// PART 0: Static Allocator
// REQUIREMENT: No Dynamic Memory (No malloc/new on Heap)
// REQUIREMENT: Bounded Memory Usage (Fixed size pool)

static char task_memory_pool[2048]; // 2KB fixed memory for all coroutine frames
static size_t pool_offset = 0;

void* my_static_alloc(size_t size) {
    // Simple bump pointer allocator
    if (pool_offset + size > sizeof(task_memory_pool)) {
        std::cerr << "[CRITICAL] Out of static memory!\n";
        std::terminate();
    }
    void* ptr = &task_memory_pool[pool_offset];
    pool_offset += size;

    std::cout << "[MEMORY] Allocated " << size << " bytes. (Used: " << pool_offset << "/" << sizeof(task_memory_pool) << ")\n";
    return ptr;
}

void my_static_free(void* ptr, size_t size) {
    // In this embedded pattern, we do not fragment memory.
    // We typically reset the entire pool only when the system restarts.
    std::cout << "[MEMORY] Free ignored (Static Strategy).\n";
}

// PART 1: Task Definition (Coroutine Handle)

struct Task {
    struct promise_type {
        // CRITICAL: Override 'new' to force storage in our static pool
        // This ensures the coroutine frame is NOT on the heap.
        void* operator new(size_t size) {
            return my_static_alloc(size);
        }

        void operator delete(void* ptr, size_t size) {
            my_static_free(ptr, size);
        }

        Task get_return_object() {
            return Task{ std::coroutine_handle<promise_type>::from_promise(*this) };
        }

        std::suspend_always initial_suspend() { return {}; } // Suspend immediately (lazy start)
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

// PART 2: Shared Data Buffer
// REQUIREMENT: No std::string or dynamic vectors

static char global_buffer[512];

// PART 3: Protocol Implementation (HTTP Simulation)
// REQUIREMENT: Concurrent execution (Not Asynchronous/Threaded)

Task http_get(const char* path) {
    // Step 1: Request Preparation
    co_await std::suspend_always{};

    std::snprintf(global_buffer, sizeof(global_buffer), "GET %s HTTP/1.1", path);
    std::cout << "[GET] Request: " << global_buffer << "\n";

    // Step 2: Wait for Response (Yield control to scheduler)
    co_await std::suspend_always{};

    std::cout << "[GET] Done (200 OK).\n";
}

Task http_post(const char* path) {
    // Step 1: Request Preparation
    co_await std::suspend_always{};

    std::snprintf(global_buffer, sizeof(global_buffer), "POST %s HTTP/1.1", path);
    std::cout << "[POST] Request: " << global_buffer << "\n";

    // Step 2: Wait for Response (Yield control to scheduler)
    co_await std::suspend_always{};

    std::cout << "[POST] Done (201 Created).\n";
}

// PART 4: Main Scheduler
// REQUIREMENT: Single-threaded cooperative multitasking

int main() {
    std::cout << "--- Embedded C++20 Coroutines (Static Memory) ---\n";

    // Initialize tasks (Allocates memory from static pool now)
    Task t1 = http_get("/index.html");
    Task t2 = http_post("/api/login");

    std::cout << "--- Scheduler Started ---\n";

    // Simple Round-Robin Scheduler
    while (!t1.done() || !t2.done()) {
        if (!t1.done()) t1.resume();
        if (!t2.done()) t2.resume();
    }

    std::cout << "--- All Tasks Finished ---\n";
    return 0;
}