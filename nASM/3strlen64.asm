;memorise rax->rdi->rsi->rdx
;memorise rax->syscall rdi->file descriptor rsi->message rdx->mesg len
section .data
    msg db "Hello world!This is a long message :)",0xA ;db is for byte - 8bits for each char
section .text
global _start
_start:
    mov rax,msg
    mov rbx,rax
nextchar:
    cmp byte[rax],0 ;0 is delimiter for strings ;type[pointer] dereferences the address
    jz done ;jz is a conditional jump statement if satisfies from cmp,will jump to "done" section
    inc rax ;else part
    jmp nextchar    ;else part
done:
    sub rax,rbx
    mov rdx,rax
    mov rax,1
    mov rdi,1
    mov rsi,msg
    syscall
    mov rax,60
    mov rdi,0
    syscall