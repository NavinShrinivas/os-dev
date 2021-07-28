;ye adding those line feeds in the end of those string worked in last program
;but we cant go around adding line feeds to end of strings is a stupid idea , c thinks otherwise , but still
;hence we are going write an other function to write linefeeds along with strings

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
    pop rax ;
    ret

;-----------Print the msg-------------
sprint:
    mov rax,1 ;syscalll for print
    mov rdi,1 ;stdout
    call slen
    syscall
    ret

sprintn:
    call sprint
    mov rsi,0
    call sprint
    ret
;------------Exit call----------
exit:
    mov rax,60
    mov rdi,0
    syscall
    ret



