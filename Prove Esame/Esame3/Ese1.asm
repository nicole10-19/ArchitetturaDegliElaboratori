#Funzione che calcola un esempio di espressione. Si faccia l’ipotesi di dover preservare tutti
# i registri utilizzati dall’espressione (compreso i $t).

.data

.text


main:
	addi $s0, $zero, 7
	addi $s1, $zero, 4
	addi $s2, $zero, 4
	addi $s3, $zero, 2
	
	move $a0, $s0
	move $a1, $s1
	move $a2, $s2
	move $a3, $s3

	jal dist
	move $s4, $v0

dist:
	
	addi $sp, $sp, -8
	sw $t0, 4($sp)
	sw $t1, 8($sp)
	
	
	addi $t0, $a0, $a1
	sub $t1, $a2, $a3
	
	srlv $t0, $t0, $t1
	sllv $t1, $a1, $a3
	
	addi $v0, $t0, $t1
	
	lw $t0, 4($sp)
	lw $t1, 8($sp)
	addi $sp, $sp, 8
	
	jr $ra 
	