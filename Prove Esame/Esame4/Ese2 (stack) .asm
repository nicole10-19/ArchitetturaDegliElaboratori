# Funzione che esegue una shift and rotate a destra su un intero a 32 bit. Si faccia l’ipotesi
# di dover preservare tutti i registri utilizzati dalla funzione (compreso i $t).


.data


.text

main:
	addi $s0, $zero, 47
	addi $s1, $zero, 4
	addi $t0, $zero, 32
	
	move $a0, $s0 #a
	move $a1, $s1 #b
	
	jal ror
	
	move $s4, $v0

ror:
	
	addi $sp, $sp, -8
	sw $t1, 0($sp)
	sw $s1 , 4($sp)
	sub $t1, $t0, $a1
	
	sllv $s1, $a0, $t1
	
	srlv $a0, $a0, $a1
	or $v0, $a0, $s1
	
	lw $s1, 4($sp)
	lw $t1, 0($sp)
	addi $sp, $sp, 8
	jr $ra