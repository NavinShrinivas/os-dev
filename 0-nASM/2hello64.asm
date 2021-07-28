section .data
    msg db "Hello world!",10

section .text
    global _start
_start:
    mov rax,1   ;syscall for sys_write in 64bit systemls
    mov rdi,1   ;sys_write file descriptor for standard output [STDOUT]
    mov rsi,msg ;message to be written
    mov rdx,12  ;len of string to write
    syscall
    mov rax,60  ;syscall for sys_exit
    mov rdi,0   ;exit status
    syscall
