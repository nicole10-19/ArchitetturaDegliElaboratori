.data
pos:	.word 0, 1, 2, 4, 16, 22, 27, 28

val:	.word 10, 1, 9, 14, 200, 22, 48, 50

array: .space 160

.text

main:
	addi $s0, $zero, 8	# n = 8
	addi $s1, $zero, 40 	# dim = 40 
	addi $t0, $zero , 0	# i = 0
	addi $t1, $zero, 0	
firstloop:
	beq $t0, $s1, iequalzero
	sll $t1, $t0, 2		# i * 4
	
	sw $t0, array($t1)	# array[i] = 0 
	
	j firstloop 

iequalzero:
	addi $t0, $zero, 0 

secondloop:
	beq $t0, $s0, exit 
	
	sll $t1, $t0, 2		# i * 4
	lw $t2, pos($t1)	# pos[i]
	
	addi $s2, $t2, 0	# j = pos[i]
	
	sll $t3, $s2, 2 	# j * 4
	lw $t4, val($t2)	# val[i]
	
	sw $t4, array($t3)	# array[j] = val[i]
	
	j secondloop

exit:
	li $v0, 10 
	syscall

	