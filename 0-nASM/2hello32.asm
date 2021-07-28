section .data

msg db "Hello World!",0xA
len equ $-msg

section .text
    global _start
_start:
    mov eax,4   ;syscall for sys_write
    mov ebx,1   ;file descriptor for standar output [STDOUT] is 1
    mov ecx,msg ;adress of string to write to buffer
    mov edx,len ;len of string to write
    int 0x80
    mov eax,1   ;syscall for sys_exit
    mov ebx,0   ;exit staus
    int 0x80    