# ⚡ Embedded Systems Project: C++20 Coroutines with Static Memory

> **Course:** Embedded Systems (Politecnico di Milano)  
> **Author:** Stiliyan Andreev  
> **Matricola:** 294967  

---

## 📖 Project Overview

This project explores the feasibility of using **C++20 Coroutines** in strict embedded environments where dynamic memory allocation is forbidden or dangerous. 

The goal is to implement a **concurrent, cooperative multitasking system** simulating an HTTP protocol **without using the Heap (malloc/new)**. By overriding the default compiler behavior, this project demonstrates that modern C++ features can be zero-cost abstractions suitable for constrained systems.

---

## 🚀 Key Features

### 🚫 Zero Dynamic Allocation (No `malloc`/`new`)
Standard C++ coroutines allocate their state frame on the heap. 
* **Solution:** I overrode the `operator new` and `operator delete` inside the coroutine `promise_type`.
* **Result:** All coroutine frames are stored in a fixed-size **static memory pool**.

### 📦 Bounded Memory Usage
* Memory usage is **deterministic** and known at compile-time.
* The system uses a simple **bump-pointer allocator** strictly limited to a static buffer (`2048 bytes`).
* If the pool is exhausted, the system terminates deterministically (simulating a hard fault protection).

### 🔄 Concurrency without Threads
* **Requirement:** "Concurrent, not asynchronous".
* **Implementation:** A **Single-Threaded Cooperative Scheduler**.
* Tasks yield control using `co_await std::suspend_always{}`, simulating I/O waits. This allows the main loop to interleave the execution of simulated HTTP GET and POST requests without OS threads.

### 🌐 HTTP Protocol Simulation
* Simulates the state machine of HTTP/1.1 (Request Preparation → Sending → Response).
* Uses a shared static buffer (`global_buffer`) to avoid `std::string` allocations entirely.

---

## 🛠️ Technical Implementation

### The Custom Allocator
To bypass the compiler's default heap allocation for coroutine frames, the following mechanism is used inside the `promise_type` struct:

```cpp
// Inside promise_type struct
void* operator new(size_t size) {
    return my_static_alloc(size); // Redirects to our static array
}

void operator delete(void* ptr, size_t size) {
    my_static_free(ptr, size);    // No-op in this static strategy
}
```

This ensures that the Assembly code generated for creating the coroutine frame jumps to the static pool logic instead of the system's malloc.

Verification
The application logs memory usage to the console to prove that no heap memory is touched:
```
[MEMORY] Allocated 272 bytes. (Used: 272/2048)
```

⚠️ Limitations (Design Choices)
Fixed Memory Pool: The pool size is hardcoded to 2048 bytes. In a production system, this would be tuned based on linker analysis.

Scheduling: The scheduler uses a simple Round-Robin approach without priority handling.

Network: The network layer is simulated via console output for demonstration purposes (no real TCP stack).

💻 How to Build and Run
Prerequisites
Compiler: MSVC (Visual Studio 2022) or GCC 10+

Standard: C++20 is REQUIRED (/std:c++20 flag).

Build with Visual Studio 2022
Open the solution file (.sln) or the folder in Visual Studio.

Ensure the C++ Language Standard is set to ISO C++20 Standard.

Build the solution (Ctrl+Shift+B).

Run without debugging (Ctrl+F5).
```
--- Embedded C++20 Coroutines (Static Memory) ---
[MEMORY] Allocated 272 bytes. (Used: 272/2048)
[MEMORY] Allocated 272 bytes. (Used: 544/2048)
--- Scheduler Started ---
[GET] Request: GET /index.html HTTP/1.1
[POST] Request: POST /api/login HTTP/1.1
[GET] Done (200 OK).
[POST] Done (201 Created).
--- All Tasks Finished ---
```
<img width="1107" height="361" alt="image" src="https://github.com/user-attachments/assets/097b314f-68e2-4951-b264-6a3daa6e4802" />
