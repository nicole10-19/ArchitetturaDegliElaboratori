#Esercizio Prova d'esame 
#Funzione che calcola un esempio di espressione, con l' ipotesi di
#dover preservare tutti i registri utilizzati dall'espressione

.data


.text
main: 
	#salvo a,b,c,d in $s0, $s1, $s2, $s3
	
	addi $s0, $zero,7 #a
	addi $s0, $zero,4 #b
	addi $s0, $zero,4 #c
	addi $s0, $zero,2 #d
	
	
	move $a0, $s0
	move $a1, $s1
	move $a2, $s2
	move $a3, $s3
	
	jal dist
	move $s4, $v0 # v = dist (a,b,c,d)
	
	#terminare 
	li $v0, 10
	syscall


dist:
	#gestione stack 
	addi $sp, $sp, -12
	sw $s0, 0($sp)
	sw $s0, 4($sp)
	sw $t0, 8($sp)
	sw $t1, 12($sp)
	
	
	#result in $s0
	add $t0, $a0, $a1
	
	sub $t1, $a2, $a3
	
	srlv $t0, $t0, $t1 # (a+b) >> (c-d)
	sllv $t1, $a1, $a3 # b << d
	add $s0, $t0, $t1
	
	move $v0, $s0
	lw $s0, 0($sp)
	lw $s0, 4($sp)
	lw $t0, 8($sp)
	lw $t1, 12($sp)
	   

