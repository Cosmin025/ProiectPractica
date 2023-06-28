BITS 32 
    global      _start

    section     .text

_start:
        mov eax,0x04
        mov ebx,1
        mov ecx,message
        mov edx, 14
        int 0x80
        mov eax, 0x1
        xor ebx, ebx
        int 0x80

section .data

message: db "Hello, World!",10