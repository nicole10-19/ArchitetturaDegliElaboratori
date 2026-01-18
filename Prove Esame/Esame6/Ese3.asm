#Funzione che calcola la distanza fra due interi.


.data


.text
main :
	addi $s0, $zero, 7
	addi $s1, $zero, 4
	
	move $a0, $s0	# a 
	move $a1, $s1	# b
	
	jal dist 
	
	move $s2, $v0

	li $v0, 10 
	syscall 
dist: 

	addi $sp, $sp, -8
	sw  $t0, 0($sp)
	sw $t1, 4($sp)
	
	slt $t0, $a0, $a1
	beq $t0, $zero, else 
	
	
	sub $t1, $a1, $a0
	j end
else:	
	
	sub $t1, $a0, $a1

end:	
	addi $sp, $sp, 8 
	lw $t1, 4($sp)
	lw $t0, 0($sp)
	addi $v0, $t1, 0 
	jr $ra
	