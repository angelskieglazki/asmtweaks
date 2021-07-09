; hello world program 32bit
; nasm -f elf hello32bit.asm
; ld -m elf_i386 hello32bit.o -o hello32bit

section .data
msg 	db 	"Hello world 32bit!", 0Ah 	; assign msg label with string(and reserve bytes for this string)

section .text
global _start

_start:
	mov 	edx, 19 	; count of bytes in output message
	mov 	ecx, msg 	; fill arguments (output buffer)
	mov 	ebx, 1 		; fill arguments (standart fd stdout == 1)
	mov 	eax, 04h 	; fill arguments (opcode for syscall write = 4)
	int 	80h

	mov 	ebx, 0 		; 0 status of exit. (no errors) 
	mov 	eax, 1 		; call exit syscall
	int 	80h
