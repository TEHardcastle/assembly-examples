# Fibonacci calculator
#
#	F-numbers labelled accordingly:
#	___________________________________________
#	|  n  |  0  |  1  |  2  |  3  |  4  |  5  |
#	| F(n)|  0  |  1  |  1  |  2  |  3  |  5  |               
#	-------------------------------------------
#
.section .data
.section .text
.globl _start
_start:
mov $10, %ecx			# load n into ecx
# if n is 1 or 0, manually 
# return 1 or 0 respectively.
cmp $1, %ecx			# check value of n
jle manual_set			# jump to manual set of F(n) if n <= 1
# Load the first 2 values 
# into eax and ebx
mov $1, %eax			# eax holds the F(n)
mov $0, %ebx			# ebx holds the F(n-1)
# replace F(n) with F(n+1), 
# and F(n-1) with F(n)
loop_start:
mov %eax, %edx			# store F(n)
add %ebx, %eax			# sum F(n) and F(n-1) to get F(n+1) in F(n) position
mov %edx, %ebx			# move stored F(n) to F(n-1) position
cmp $2, %ecx			# check remaining step count
jz exit				# exit if finished
dec %ecx			# reduce remaining step count
jmp loop_start			# restart loop
# End the program
manual_set:
mov %ecx, %eax			# manually set F(n)
exit:
mov %eax, %ebx
mov $1, %eax
int $0x80
