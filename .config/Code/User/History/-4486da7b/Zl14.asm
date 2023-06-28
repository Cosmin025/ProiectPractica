BITS 32
2 global _start
3
4 section .text
5 _start: mov eax, 0x04
6 mov ebx, 1
7 mov ecx, message
8 mov edx, 14
9 int 0x80
10 mov eax, 0x1
11 xor ebx, ebx
12 int 0x80
13
14 section .data
15 message: db "Hello, World!", 10