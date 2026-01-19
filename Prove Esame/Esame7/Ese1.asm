.data



.text


main:
	addi $s0, $zero, 7	#x = 7
	addi $s1, $zero, 28	# y = 28
	addi $s2, $zero, 0 	# i = 0
	
	addi $s3, $zero , 32 	# per ciclo while 
	addi $s4, $zero, 0	# equal = 0
while:
	
	beq $s2, $s3, end
	beq $s4, $zero, end
	
	
	bne $s0, $s1, go
	addi $s4, $zero, 1

go:
	andi $t0, $s1, 1
	
	sll $t0, $t0, 31
	srl $s1, $s1, 1
	
	or $s1, $s1, $t0
	addi $s1, $s1, 1 
	j while
end:
	# Rivedere stampa 
	li $v0, 10
	syscall