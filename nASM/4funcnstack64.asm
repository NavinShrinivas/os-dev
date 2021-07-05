section .data
    msg db "Let's try and make this a long string just for the 2 reason",10,"this is an extention"

section .text
    global _start:
_start:
    mov rsi,msg
    mov rax,msg
    call len
    mov rax,1
    mov rdi,1
    syscall
    mov rax,60
    mov rdi,0
    syscall
len:
    push rsi
    mov rsi,rax
next:
    cmp byte[rsi],0
    jz done
    inc rsi
    jmp next
done:
    sub rsi,rax
    mov rdx,rsi
    pop rsi
    ret

    ;all string or db's are terminated by a 0 which iin ascii stands for NULL