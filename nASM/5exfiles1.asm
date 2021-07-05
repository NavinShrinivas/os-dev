%include'5stdio.asm'
 
section .data
msg0    db  "Without NULL chars : ",10,0
msg1    db  "Hello, brave new world!",10
msg2    db  "This is how we recycle in NASM.",10,0

msg3    db  "With NULL char's :",10,0
msg4    db  "Hello, brave new world!",10,0
msg5   db  "This is how we recycle in NASM",10,0
 
section .text
    global  _start:
_start:
    mov     rsi,msg0
    call    sprint
    mov     rsi,msg1
    call    sprint
    mov     rsi,msg2
    call    sprint
    ;note this prints the last sentences twice to finx this we must append a NULL char at
    ;end of first string see the exmaples below

    mov rsi,msg3
    call sprint
    mov rsi,msg4
    call sprint
    mov rsi,msg5 
    call sprint

    ;I cant figure out why this is giving me a seg fault , these seg faulst gonna haunt me for the rest
    ;of my damn life