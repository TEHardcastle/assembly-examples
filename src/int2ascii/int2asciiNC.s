# Integer to ASCII conversion
#
# A 4 digit decimal integer is converted into a string of 4 bytes corresponding to 
# its ascii representation
# 
# 	For reference:
# 	___________________________________________________
#	|  0 |  1 |  2 |  3 |  4 |  5 |  6 |  7 |  8 |  9 |
# 	| 30 | 31 | 32 | 33 | 34 | 35 | 36 | 37 | 38 | 39 |
# 	---------------------------------------------------
#
.section .data
.section .text
.globl _start
_start:
mov $2345, %ecx
mov $1000, %eax
mov $10, %ebx
loop_start:
sub %eax, %ecx
js blah
inc %dl
jmp loop_start
blah:
add %eax, %ecx
idiv %ebx
here:
shl $8, %edx
jmp loop_start
nop

