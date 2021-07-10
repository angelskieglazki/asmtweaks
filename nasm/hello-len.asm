; hello world string len count 
; nasm -f elf hello-len.asm
; ld -m elf_i386 hello-len.o -o hello-len


section .data
msg 	db 	"Hello world 32bit!", 0Ah 	; assign msg label with string
						; and reserve bytes for this string

section .text
global _start

_start:
	mov 	ebx, msg 	; copy address of msg into EBX
	mov 	eax, ebx 	; copy address in EBX into EAX

nextchar:
	cmp 	byte [eax], 0
	jz 	finish
	inc 	eax
	jmp 	nextchar

finish:
	sub 	eax, ebx

	mov 	edx, eax
	mov 	ecx, msg
	mov 	ebx, 1
	mov 	eax, 4
	int 	80h


	mov 	ebx, 0
	mov 	eax, 1
	int 	80h

