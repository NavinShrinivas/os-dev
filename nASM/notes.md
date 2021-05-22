# Learning Assembly

## links used :

* [Official nASM docs](https://www.nasm.us/doc/) and [this](https://cs.lmu.edu/~ray/notes/nasmtutorial/) , It's nice.
* Majorly using [this](https://www.tutorialspoint.com/assembly_programming/assembly_basic_syntax.htm) for starting out!All other resources seem too intimidatiing!

## Assembling code :

Let's first install **gcc** and **nasm** in our machines , as of yet we don't need a vm.

Lets execute the 1test.asm to see if our installs are successful.[PS Note: the code here work only on x86 Linux machines]
	this picture blew this sentence is of utmost importance to understand out compiling command
	![](https://static.javatpoint.com/cpages/images/compilation-process-in-c2.png)<br><br>
	But we write out code directly in ASM and with the command <br>
		<center><code>nasm -felf64 1test.asm</code> <br></center>
		we get out object file often called elf type files , After that command you would now have a "1test.o" file. Note that the "1test.o" is not yet executable , ***go ahead and try it!*** .
That's because we haven't linked all the needed libraries for our assembly code to work. Enter the ```ld``` command , this command is part of gcc compiler and will help us link libraries to our assembly code. Also the option "felf64" in nasm assembler is to get a 64 bit based elf file.
Now, let do our linker command :<br>
	<center><code>ld -o 1final.o ./1test.o</code> <br></center>
	We now have out executable code , lets execute it with<br>
	<center><code>./1final.o</code> <br></center>
	You have now assembled your first assembly code. Congrats!
	
## Assembly code structure

Like most assemblers, each NASM source line contains some combination of four fields<br>
![](https://cs.lmu.edu/~ray/images/nasmstructure.png)<br><br>
So to make our life's a bit easier lets break down this code in terms of columns and rows.

There can be many columns called sections , There is a different kind of section called "Directive" , Unlike most assembly code directive columns don't have 4 rows.

Generally, you put code in a section called `.text` and your constant data in a section called `.data`.
And coming to normal sections they have at most 4 rows,in the order :

| Labels| Instructions|Operands|Comments
| ----------- | ----------- |-----------|-----------|
|If observed these always end with ':'|Literally an instruction which works on the operand.These are also at times called mnemonic|Well! These are operands.|These are of course optional and start with a ;|

A little bit more about sections:
### The _data_ Section
The **data** section is used for declaring initialized data or constants. This data does not change at runtime. You can declare various constant values, file names, or buffer size, etc., in this section.
The syntax for declaring data section is −
<center><code>section.data</code></center>

### The _bss_ Section
The **bss** section is used for declaring variables. The syntax for declaring bss section is −
<center><code>section.bss</code></center>

### The _text_ section
The **text** section is used for keeping the actual code. This section must begin with the declaration **global _start**, which tells the kernel where the program execution begins.
The syntax for declaring text section is −
![]()
