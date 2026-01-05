Embedded HTTP Server: C++20 Coroutines with Static Memory
Course: Embedded Systems (Politecnico di Milano) Author: Stiliyan Andreev Matricola: 294967

Project Overview
This project implements a Single-Threaded, Cooperative HTTP 1.0 Server using C++20 Coroutines and Winsock.

It is designed to simulate a safety-critical embedded environment where Heap allocation (malloc/new) is strictly forbidden and OS Threads are too heavy. The server handles multiple concurrent connections on a single thread by using a custom scheduler and non-blocking I/O.

Key Architectural Pillars
1. Zero Dynamic Allocation (Static Memory Only)
To comply with strict embedded constraints, this project does not use the Heap.

Strategy: A fixed-size 64KB global buffer (task_memory_pool) is allocated at compile-time (BSS segment).

Implementation: The standard operator new is overridden inside the Coroutine promise_type.

Result: All coroutine frames and local variables are stored in this static buffer. If the buffer is full, the system terminates deterministically rather than fragmenting memory.

2. Cooperative Multitasking (No OS Threads)
Instead of using heavy OS threads (Preemptive Multitasking), this server uses Cooperative Multitasking.

Coroutines: Each client connection is handled by a Task coroutine.

Context Switching: When a task waits for I/O, it yields control (co_await) back to the main scheduler.

Efficiency: This allows handling up to 5 concurrent clients on a single CPU thread with minimal overhead.

3. Non-Blocking I/O & Concurrency
The server uses Non-Blocking Sockets (FIONBIO mode) to prevent slow clients from freezing the system.

The Logic: When recv() returns WSAEWOULDBLOCK (no data ready), the coroutine suspends execution immediately.

The Scheduler: The main() loop then moves to the next client in the queue (Round-Robin scheduling).

Robustness: This ensures that a client sleeping or sending data slowly does not block other clients.

Technical Implementation Details
The Static Allocator
We intercept C++ memory requests to ensure they go to our fixed buffer:
```
// Inside promise_type struct
void* operator new(size_t size) {
    return my_static_alloc(size); // Redirects to static char task_memory_pool[65536]
}

void operator delete(void* ptr, size_t size) {
    my_static_free(ptr, size);    // No-op (Bump-pointer strategy)
}
```
The State Machine (Non-Blocking Read)
The server handles TCP fragmentation and polling using a state machine loop:
```
if (bytes == SOCKET_ERROR) {
    int err = WSAGetLastError();
    if (err == WSAEWOULDBLOCK) {
        // No data yet? Pause task and yield to scheduler.
        co_await std::suspend_always{};
        continue;
    }
}
```
How to Build and Run
Prerequisites
OS: Windows (Required for winsock2.h)

Compiler: MSVC (Visual Studio 2022 recommended)

Standard: C++20 (/std:c++20)

Steps
Open the project in Visual Studio.

Ensure C++20 is selected in Project Properties -> C/C++ -> Language.

Build the solution (Ctrl+Shift+B).

Run the server (Ctrl+F5).

Testing & Verification
1. Basic Connection Test
Open a terminal and run curl:
```
curl -UseBasicParsing http://localhost:8080
```
Expected Output: 
```
Windows PowerShell
Copyright (C) Microsoft Corporation. All rights reserved.

Install the latest PowerShell for new features and improvements! https://aka.ms/PSWindows

PS C:\Users\stili> curl -UseBasicParsing http://localhost:8080


StatusCode        : 200
StatusDescription : OK
Content           : Hello World!

RawContent        : HTTP/1.0 200 OK
                    Connection: close
                    Content-Length: 13
                    Content-Type: text/plain

                    Hello World!

Forms             :
Headers           : {[Connection, close], [Content-Length, 13], [Content-Type, text/plain]}
Images            : {}
InputFields       : {}
Links             : {}
ParsedHtml        :
RawContentLength  : 13



PS C:\Users\stili> curl -UseBasicParsing http://localhost:8080


StatusCode        : 200
StatusDescription : OK
Content           : Hello World!

RawContent        : HTTP/1.0 200 OK
                    Connection: close
                    Content-Length: 13
                    Content-Type: text/plain

                    Hello World!

Forms             :
Headers           : {[Connection, close], [Content-Length, 13], [Content-Type, text/plain]}
Images            : {}
InputFields       : {}
Links             : {}
ParsedHtml        :
RawContentLength  : 13
```

From Python file slow.py on my Dekstop:
```
PS C:\Users\stili> cd Desktop
PS C:\Users\stili\Desktop> python slow.py
--- Client A Connecting... ---
--- Client A Connected! I will sleep for 10 seconds... ---
--- Client A Waking up and sending data! ---
Response: HTTP/1.0 200 OK
Content-Type: text/plain
Content-Length: 13
Connection: close

Hello World!

PS C:\Users\stili\Desktop>
```
You need to run Ctrl + F5. then another terminal(windows powershell) execute - (cd Dekstop) and (python solve.py).
on the third terminal i put ``` curl -UseBasicParsing http://localhost:8080 ```
output for the --- HTTP Server (Async/Non-Blocking) on 8080 --- (first terminal) it is:
```
--- HTTP Server (Async/Non-Blocking) on 8080 ---
[SCHEDULER] New client in slot 0
[SERVER] Full request received.
[SERVER] Task finished.
[SCHEDULER] New client in slot 1
[SERVER] Full request received.
[SERVER] Task finished.
[SCHEDULER] New client in slot 1
[SERVER] Full request received.
[SERVER] Task finished.
[SCHEDULER] New client in slot 1
[SERVER] Full request received.
[SERVER] Task finished.
[SERVER] Full request received.
[SERVER] Task finished.
[SCHEDULER] New client in slot 0

```
