# Gas hello world string len example
# gcc -c hello-len.S
# ld hello-len.o -o hello-len
# ./hello-len

	.data
msg: 	.asciz 	"Hello gas! 32bit\n"

	.global _start
	.text
_start:
	mov 	$msg, %ebx 	# copy address of msg inte EBX
	mov 	%ebx, %eax 	# copy address in EBX into EAX

nextchar:
	cmpb    $0, (%eax)
	jz 	finish
	inc 	%eax
	jmp 	nextchar

finish:
	sub 	%ebx, %eax

	mov 	%eax, %edx 	# count of bytes in output message
	mov 	$msg, %ecx 	# fill arguments (output buffer)
	mov 	$1, %ebx 	# fill arguments (standart fd stdout == 1)
	mov 	$4, %eax 	# fill arguments (opcode for syscall write = 4)
	int 	$0x80

	mov 	$0, %ebx 	# 0 status of exit. (no errors)
	mov 	$1, %eax 	# call exit syscall
	int 	$0x80
