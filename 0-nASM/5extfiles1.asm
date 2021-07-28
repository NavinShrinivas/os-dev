%include'5stdo.asm'
 
section .data
msg1    db  "Hello, brave new world!",10,0
msg2    db  "This is how we recycle in NASM.",10,0

 
section .text
    global  _start:
_start:
    mov     rsi,msg1
    call    sprint
    mov     rsi,msg2
    call    sprint
    ;note this prints the last sentences twice to finx this we must append a NULL char at
    ;end of first string see the exmaples below