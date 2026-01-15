.data
array: .word 0, 1, 2, 4, 4, 6, 7, 9




.text
main:
	addi $s0, $zero , 6	# elem = 6
	addi $s1, $zero, 8	# n = 8 
	addi $s2,$zero, -1	# found = -1 
	
	srl $s3, $s1, 1 	#i = n/2, per dividere per due basta inserire 1, poichè 2^1 = 2 
	
	addi $s4, $zero, $zero	#low = 0 
	sub $s5, $s1, 1		#up = n - 1
	
while: 
	slt $t1, $s2, $zero
	beq $t1, $zero, end
	beq $s5, $s4, end
	
	sll $t1, $s3, 2
	lw $t2, array($t1)
	
	bne $t2, $s0, else
	addi $s2, $zero, $s3
	j endif
else:
	
	slt $t1, $t2, $s0
	beq $t1, $zero, secondelse
	addi $s5, $zero, $s3 
	j endif
secondelse:
	addi $s4, $zero, $s3
	j endif
endif:
	add $t0, $s4, $s5
	srl $s3, $t0, 1
end:
	li $v0, 10
	syscall