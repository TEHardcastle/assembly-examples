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
movl $3543,%eax
loop1: 
subl $1000,%eax
js preloop2
incl %ebx
jmp loop1
preloop2: 
addl $0x30,%ebx
shll $24,%ebx
addl $1000,%eax
loop2: 
subl $100,%eax
js preloop3
incl %ecx
jmp loop2
preloop3: 
addl $0x30,%ecx
shll $16,%ecx
addl %ecx,%ebx
addl $100,%eax
loop3: 
subl $10,%eax
js preloop4
incb %bh
jmp loop3
preloop4: 
addb $0x30,%bh
addl $10,%eax
addl %eax,%ebx
addl $0x30,%ebx
end:
mov $1, %eax
int $0x80

