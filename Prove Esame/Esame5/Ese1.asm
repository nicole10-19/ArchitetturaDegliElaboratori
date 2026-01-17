.data 



.text

main:
	#s0 = a 
	#s1 = mna
	#s2 = mxa
	#s3 = mnb
	#s4 = mxb
	
	#t0 = a 
	#t1 = apppa 
	#t2 = appb
	addi $t1, $zero, 0	# appa = 0 
	addi $t2, $zero, 0 	# appb = 0
	
	slt $t3, $s0, $s1
	beq $t3, $zero, if
	
	slt $t3, $s2, $s0
	bne $t3, $zero, if

	
	addi $t1, $zero, 1 #appa = 1 

	
if:
	slt $t3, $s0, $s3
	beq $t3, $zero, end
	slt $t3, $s4, $s0
	bne $t3, $zero, end
	addi $t2, $zero, 1 # appb = 1 

end:
	li $v0, 10
	syscall