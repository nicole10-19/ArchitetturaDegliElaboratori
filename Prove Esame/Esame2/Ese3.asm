.data


.text

main:
	addi $s0, $zero , 7 # x = 7
	addi $s1, $zero, 4 # y = 4 
	
	move $a0, $s0
	move $a1, $s1
	
	jal dist
	
	move $s2, $v0

dist:
	#Gestione stack
	#----------------#
	addi $sp, $sp, -8 
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	#---------------#
	
	
	slt $t0, $a1, $a0 # b < a , se è falso (0) passa a else 
	beq $t0, $zero, else
	sub $t1, $a0, $a1
	j finish
	
	else:
	sub $t1, $a1, $a0
	
	finish:
	addi $v0, $t1, 0
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	addi $sp, $sp, 8
	
	jr $ra