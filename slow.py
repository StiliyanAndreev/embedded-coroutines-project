import socket
import time

print("--- Client A Connecting... ---")
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect(('localhost', 8080))

print("--- Client A Connected! I will sleep for 10 seconds... ---")
time.sleep(10)

print("--- Client A Waking up and sending data! ---")
s.send(b"GET / HTTP/1.0")


s2 = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s2.connect(('localhost', 8080))

print("--- Client A Connected! I will sleep for 10 seconds... ---")
time.sleep(10)

print("--- Client A Waking up and sending data! ---")
s2.send(b"GET / HTTP/1.0\r\n\r\n")
print("Response:", s2.recv(1024).decode())




s.close()
