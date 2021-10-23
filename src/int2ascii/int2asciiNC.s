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
mov $7496, %ecx
mov $1000, %eax
mov $10, %edx
loop_start:
sub %eax, %ecx
js next_char
inc %bl
jmp loop_start
next_char:
cmp $1, %eax
je end
add %eax, %ecx
div %dl
shl $8, %ebx
jmp loop_start
end:
xor %ecx, %ecx
xor %edx, %edx
add $0x30303030, %ebx
mov $1, %eax
int $0x80

