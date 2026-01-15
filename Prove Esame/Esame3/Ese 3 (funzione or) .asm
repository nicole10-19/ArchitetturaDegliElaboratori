#Funzione che esegue una shift and rotate a destra su un intero a 32 bit. Si faccia l’ipotesi
#di dover preservare tutti i registri utilizzati dalla funzione (compreso i $t).

.data


.text

main: 	
	addi $s0, $zero, 47	#a = 47
	addi $s1, $zero, 4	# b = 4
	
	move $a0, $s0
	move $a1, $s1 		# per passare a e b come parametri della funzione ror()
	
	jal ror 
	
	move $s2, $v0

ror:	
	
	addi $sp, $sp, -8
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	
	sub $t0, 32, $a1
	
	sllv $t1, $a0, $t0
	srlv  $a0, $a0, $a1
	or $v0, $a0, $t1
	
	lw $t1, 4($sp)
	lw $t0, 0($sp)
	addi $sp, $sp , 8 
	
	jr $ra