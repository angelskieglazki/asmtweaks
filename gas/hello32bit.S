# Gas hello world example
# gcc -c hello32bit.S
# ld hello32bit.o -o hello32bit
# ./hello32bit

	.data
msg: 	.asciz 	"Hello gas! 32bit\n"

	.global _start
	.text
_start:
	mov 	$17, %edx 	# count of bytes in output message
	mov 	$msg, %ecx 	# fill arguments (output buffer)
	mov 	$1, %ebx 	# fill arguments (standart fd stdout == 1)
	mov 	$4, %eax 	# fill arguments (opcode for syscall write = 4)
	int 	$0x80

	mov 	$0, %ebx 	# 0 status of exit. (no errors)
	mov 	$1, %eax 	# call exit syscall
	int 	$0x80
