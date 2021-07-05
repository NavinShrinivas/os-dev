;-----------------finds the len-----------------
slen:
    push rsi
    mov rsi,rax
next:
    cmp byte[rax],0
    jz end
    inc rax
    jmp next
end:
    sub rax,rsi
    mov rdx,rax ;rdx has the len now
    pop rsi ;rsi has the message recieved from the main prgrm
    ret

;-----------Print the msg-------------
sprint:
    mov rax,rsi
    call slen
    mov rax,1 ;syscalll for print
    mov rdi,1   ;stdout
    syscall
    ret
;------------Exit call----------
exit:
    mov rax,60
    mov rdi,0
    syscall



