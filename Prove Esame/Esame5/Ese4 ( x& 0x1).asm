.data


.text


main:
	addi $s0, $zero, 468	#x = 468
	addi $s1, $zero, 0	# i = 0
	addi $t2, $zero, 32
	
	andi $s2, $s0, 1  
while:
	slt $t3, $s1, $t2
	beq $t3, $zero, end
	
	bne $s2, $zero, end
	
	srl $s0, $s0, 1		# x = x >> 1 
	
	andi $s2, $s0, 1	# y = x & 1 
	
	addi $s1, $s1, 1 
	j while
end: 
	li $v0, 10 
	syscall 
	