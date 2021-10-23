.section .data
.section .text
.globl _start
_start:
mov $1000, %eax
mov $10, %ebx
div %ebx
xor %eax, %eax
xor %ebx, %ebx
mov $10, %eax
mov $1000, %ebx
div %ebx
nop
nop
nop
