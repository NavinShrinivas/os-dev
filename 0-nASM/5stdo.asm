;-----------------finds the len-----------------
slen:
    push rax
    mov rax,rsi
next:
    cmp byte[rax],0
    jz end
    inc rax
    jmp next
end:
    sub rax,rsi
    mov rdx,rax ;rdx has the len now
    pop rax
    ret

;-----------Print the msg-------------
sprint:
    mov rax,1
    mov rdi,1
    call slen
    syscall
    ret
;------------Exit call----------
exit:
    mov rax,60
    mov rdi,0
    syscall



