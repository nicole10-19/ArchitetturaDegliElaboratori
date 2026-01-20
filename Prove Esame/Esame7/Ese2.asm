# Funzione che valuta un espressione. Si raccomanda di slvare sullo stack le variabili utilizzate.
.data 


.text

main:
	addi $s0, $zero, 47	# a = 47
	addi $s1, $zero, 4	# b = 4
	addi $s2, $zero, 8	# c = 8
	
	move $a0, $s0
	move $a1, $s1
	move $a2, $s2
	
	jal prova 
	move $s3, $v0
	
	li $v0, 10 
	syscall 
prova:
	
	addi $sp, $sp, -12 
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	
	add $t0, $a0, $a1
	add $t1, $a1, $a2
	
	srl $t2, $t0, 1
	
	add $t0, $t0, $t2
	
	addi $t1, $t1, 8 
	
	sub $v0, $t0, $t1 
	
	lw $t2, 8($sp)
	lw $t1, 4($sp) 
	lw $t0, 0($sp)
	addi $sp, $sp, 12 
	jr $ra 
	