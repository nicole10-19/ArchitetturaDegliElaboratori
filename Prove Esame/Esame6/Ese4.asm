.data



.text

main:	

	addi $s0, $zero, 18	# x = 18 
	addi $s1, $zero, 0	# n = 0
	addi $s2, $zero, 0	# i = 0
	
	addi $t0, $zero, 32	# per ciclo while 


while: 
	slt $t1, $s2, $t0
	beq $t1, $zero, end 
	
	andi $s3, $s0, 1
	
	add $s1, $s1, $s3
	
	sll $s0, $s0, 1
	addi $s2, $s2, 1 
	j while 
end:
	li $v0, 10 
	syscall 