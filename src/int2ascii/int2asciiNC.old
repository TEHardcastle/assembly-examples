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
mov $1111, %eax
loop1: 
sub $1000, %eax
js preloop2
inc %bl
jmp loop1
preloop2: 
shl $8, %ebx
add $1000, %eax
loop2: 
sub $100, %eax
js preloop3
inc %bl
jmp loop2
preloop3: 
shl $16, %ebx
add $100, %eax
loop3: 
sub $10, %eax
js preloop4
inc %bh
jmp loop3
preloop4: 
add $10, %eax
add %eax, %ebx
add $0x30303030, %ebx
end:
mov $1, %eax
int $0x80

