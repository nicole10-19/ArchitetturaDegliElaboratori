#Funzione che calcola un esempio di espressione. Si faccia l'ipotesi di dover preservare
# tutti i registri utilizzati dall'espressione (comrpeso i $t ( salvataggio stack) )

.data



.text
main:
#salvo a, b, c, d, in $s0, $s1, $s2, $s3 rispettivamente
	addi $s0, $zero, 7 # a = 7
	addi $s1, $zero, 4 # b = 4
	addi $s2, $zero, 4 # c = 4
	addi $s3, $zero, 2 # d = 2

# Devo salvare a,b,c,d nei valori di $a perchè verranno passati come parametri della funzione 
	move $a0, $s0
	move $a1, $s1
	move $a2, $s2
	move $a3, $s3
	
	
	jal dist
	
	
# Salvo v in $s4
	move $s4, $v0

# Temino 
	li $v0, 10
	syscall 
		
dist:
	#a in $a0, b in $a1, c in $a2, d in $a3
	#gestione dello stack 
	addi $sp, $sp, -12
	sw $s0, 0($sp)
	sw $t0, 4($sp)
	sw $t1, 8($sp)
	
	#result in $s0
	
	# espressione di result è   (a+b) >> (c-d) + b<<d
	add $t0, $a0, $a1 # a+b
	sub $t1, $a2, $a3 # c - d
	
	srlv $t0, $t0, $t1 # (a + b) >> (c - d)
	sllv $t1, $a1, $a3 #b << d
	
	add $s0, $t0, $t1 #espressione
	move $v0, $s0
	
	
	lw $t1, 8($sp)
	lw $t0, 4($sp)
	lw $s0, 0($sp)
	addi $sp, $sp, 12
	
	
	jr $ra #return 
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	