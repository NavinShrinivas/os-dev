%include'6stdo.asm'
 
section .data

msg1    db  "Hello, brave new world!",10
msg2    db  "This is how we recycle in NASM.",10
 
section .text
    global  _start:
_start:
    mov  rsi,msg1
    call sprintn
    mov rsi,msg2
    call sprintn
    