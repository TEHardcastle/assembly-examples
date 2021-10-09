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
# load our integer (digits: mnpq)
# into the eax register
movl $3543,%eax 
# start the first loop
loop1:
# subtract 1000 from mnpq
subl $1000,%eax
# if subtracting 1000 returns a
# negative jump out of the loop 
js preloop2
# if mnpq is still positive after
# subtracting 1000, increment ebx
incl %ebx
# restart the first loop
jmp loop1
# After the first loop is finished
# ebx contains the digit m
preloop2:
# Adding 0x30 converts m to its 
# equivalent ascii byte
addl $0x30,%ebx				# ebx: 0000000m -> 0000003m
# Bitshifting by 24 moves the byte 
# from the right of ebx to the left
shll $24, %ebx				# ebx: 0000003m -> 3m000000
# The previous loop subtracts 1000 
# from eax one too many times.
addl $1000,%eax	
# eax now contains our integer minus 
# the thousands component (digits: npq)
# and we start the second loop
loop2: 
# subtract 100 from npq
subl $100,%eax
# jump out of the loop when this 
# makes eax negative
js preloop3
# if npq is still positive
# increment ecx 
incl %ecx
# restart the second loop
jmp loop2
# after the second loop is finished
# ecx contains the digit n
preloop3:
# convert n to its ascii value
addl $0x30,%ecx				# ecx: 0000000n -> 0000003n
# bit shift the byte to the 
# appropriate position
shll $16,%ecx				# ecx: 0000003n -> 003n0000
# Add this byte to ebx
addl %ecx,%ebx				# ebx: 3m000000 -> 3m3n0000
# As before the loop subtracts 100
# from eax one too many times
addl $100,%eax
# start loop3 with digits pq in eax
loop3: 
# subtract 10 from pq
subl $10,%eax
# if eax goes negative jump out 
# of the loop
js preloop4
# We can now directly increment the
# appropriate byte in ebx
incb %bh				# ebx: 3m3nxx00 (incrementing byte xx)
# restart the loop
jmp loop3
# after loop 3, ebx contains the digit
# p in the correct position
preloop4: 
# convert p into its ascii byte
addb $0x30,%bh				# ebx: 3m3n0p00 -> 3m3n3p00
# as before the loop subtracts 10 one
# too many times from eax
addl $10,%eax
# eax now contains just the digit q 
# which is added directly to ebx
addl %eax,%ebx				# ebx: 0000000q -> 3m3n3p0q
# convert q to its ascii byte
addl $0x30,%ebx				# ebx: 3m3n3p0q -> 3m3n3p3q
# ebx now contains the 4 ascii bytes 
# that represent integer mnpq
end:
mov $1, %eax
int $0x80

