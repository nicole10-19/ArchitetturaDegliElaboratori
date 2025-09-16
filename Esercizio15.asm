#Prova Esame 
#Nome Cognome Matricola 


#Esercizio 3: Funzione che calcola la distanza fra due interi 

.data

.text

main:
	addi $s0, $zero, 7 #x
	addi $s1, $zero, 4 #y
	add $a0, $zero, $zero
	
	add $t1, $zero, $zero #result
	if:
	sle $t2, $s0, $s1
	beq $t2, $zero, else
	sub $t1, $s0, $s1
	j exit
	else:
	sub $t1, $s1, $s0
exit:
	add $a0, $zero, $t1 
	add $v0, $zero, $a0
	li $v0, 4
	syscall
	
	li $v0, 10
	syscall 

