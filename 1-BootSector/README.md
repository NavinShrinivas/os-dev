# Environment 
Before we go further to write a Boot Sector from scratch let's make sure our envirenments are ready to build the stuff we need , In the previous module we had setup our nasm assembler.

Here we will also be using qemu , qemu is a visualizer/emulator whcih will help run our OS we write.

# boot sequence
The very first thing that starts when the computer is powered on is the BIOS [Basic Input Output System], This BIOS however does not know how to boot a OS , but one thing BIOS can do is pass on this work to a program store in a partition called "Boot Sector" , this sector thus must be placed in a known location [and of a size do 512 bytes] , It is always found in the first sector of the disk. Also the BIOS checks if the DRIVE CONTENTS are bootable, to make it bootable we must represent 0xAA55 using the bytes 511 and 512 of the boot sector.

## A little about HEXADECIMAL :)

0xAA55 in decimal will be : (10x16^3^)+(10x16^2^)+(5x16^1^)+(5x16^0^)=43605

And , every digit on HEX i.e 0,1,2...9,A,B...F need 4 bits to be represented , hence with 1 Byte (8 Bits) , I can represent 2 HEX digits , thus for repsenting AA55 i need 16 bits, i.e 2 bytes.
The paragraph above is written out of my mind completely as I had a hard time understanding why even are those hex dumps represent with 2 chars in each set , this should clear it up , if it doesn't read it a few more times , might help.

## Let's write our boot sector now
BootSector.asm : 
```
times 510  db  0
dw 0xaa55
```
Assembling with : 
```
nasm -f bin BootSector.asm -o BootSector.bin
```
And getting the hexdumps of our binary elf file we see :
```
╰─$ hexdump -C BootSector.bin
00000000  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
*
000001f0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 55 aa  |..............U.|
00000200
```
Ok , so now lets learn about hexdumps ,
The left most row [top down is being considered as row] , is the offset ,  every file starts from 0x0000h [00000000 from first row] and each row has 16 bytes of data thus the next row comes at 0x0010h [00000010] ans so on 000001f0 [0x01f0h] this offsets the memory location to 496 bytes , in that row we exactly see 55 AA in bytes 511 and 512.

The star  in hexdump basically just says that there are n number fo row repeated with the same contents as before row.
With this out BIOS knows the hardrive is bootable , but , There is nothing for the cpu to be busy on , so we simply add a infinite for loop and adjust the adresses of 0xAA55 respectively.

BootSector.asm : 
```
infl:
	jump infl

times 510  db  0
dw 0xaa55
```
booting this using qemu should simply show u "booting from hard disk" , Infinite loop!