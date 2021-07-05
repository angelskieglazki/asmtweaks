;nasm -f -elf hello5.asm
;ld -m elf_i386 hello5.o -o hello5
%include "stud_io.inc"
global _start

section .text
_start: mov	eax, 0
again:	PRINT	"HELLO"
	PUTCHAR	10
	inc	eax
	cmp	eax, 5
	jl	again
	FINISH