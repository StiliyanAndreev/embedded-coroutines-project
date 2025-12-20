#  Embedded HTTP Server: C++20 Coroutines with Static Memory

> **Course:** Embedded Systems (Politecnico di Milano)  
> **Author:** Stiliyan Andreev  
> **Matricola:** 294967  


## 📖 Project Overview

This project implements a **lightweight HTTP 1.0 Server** using **C++20 Coroutines** and **Winsock**. It is designed to demonstrate how modern C++ features can be used in strict embedded environments where **dynamic memory allocation (Heap) is forbidden**.

Unlike simple simulations, **this is a functional server** listening on TCP Port 8080. It accepts connections from real-world clients (like `wget`, `curl`, or web browsers), processes GET requests, and sends valid HTTP responses using a custom static allocator.


##  Key Features

### 1. Real-World Connectivity
* **Server-Side Implementation:** Listens on `localhost:8080` using standard Sockets (Winsock).
* **Compatibility:** Can be tested with standard tools:
  ```
  # Test with curl
  curl -v http://localhost:8080
  ```

  2. Zero Dynamic Allocation (No malloc/new)
Problem: Standard C++ coroutines allocate their state frame on the heap.

Solution: I overrode the operator new and operator delete inside the coroutine promise_type.

Result: All coroutine state frames are stored in a fixed-size static memory pool (4KB).

Verification: The system logs memory usage and relies on a custom static allocator, ensuring deterministic behavior.

3. Cooperative Task Scheduling
The server accepts a connection and spawns a Coroutine Task.

The task is executed cooperatively by the main scheduler loop, handling reading, parsing, and sending data without spawning OS threads.

🛠️ Technical Implementation
The Static Allocator
To ensure zero heap usage, the coroutine promise overrides memory allocation to use a static buffer instead of malloc:

```
// Inside promise_type struct
void* operator new(size_t size) {
    return my_static_alloc(size); // Redirects to static char array[4096]
}

void operator delete(void* ptr, size_t size) {
    my_static_free(ptr, size);    // No-op in this static strategy
}
```
Server Logic Flow
Init: Winsock setup, Socket creation, Bind to Port 8080, Listen.

Loop: Blocks on accept() to wait for a client.

Handle: Spawns a handle_client coroutine task.

Coroutine: * Reads data from socket (recv).

Checks for "GET".

Sends "200 OK" response (send).

Closes socket.

 How to Build and Run
Prerequisites
OS: Windows (Uses winsock2.h).

Compiler: MSVC (Visual Studio 2022).

Standard: C++20 (/std:c++20).

Steps
Open the solution in Visual Studio.

Build (Ctrl+Shift+B).

Run (Ctrl+F5).

Open a terminal and test: curl http://localhost:8080.

Expected Output
Server Console:
```
--- HTTP Server listening on port 8080 ---
--- Run 'curl -v http://localhost:8080' to test ---
[SERVER] Client connected. Reading request...
[SERVER] Received:
GET / HTTP/1.1
User-Agent: Mozilla/5.0 ...
Host: localhost:8080
...
[SERVER] GET request detected. Sending response...
[SERVER] Connection closed.
```

Client Terminal (PowerShell/curl):
```
StatusCode        : 200
StatusDescription : OK
Content           : Hello World! It's working!!!!!!
RawContent        : HTTP/1.0 200 OK
                    Connection: close
                    Content-Length: 32
                    Content-Type: text/plain

```

