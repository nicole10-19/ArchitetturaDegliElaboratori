#Esercizio da Esame 
#Nome Cognome Matricola 

#Programma inteso a verificare le differenze fra & e && in C 



.data

.text
main:
	li $s0, 9 #x
	li $s1, 6 #y
	li $t0, 0 #w
	
if:
	andi	$t1, $s0, $s1
	beq	$t1, $zero, else
	li $t0, 1 1
	j exit
	
else:
#Le seguenti istruzioni servono a verificare se x && y sono diverse da 0 
	beq $s0, $zero, exit
	beq $s1, $zero, exit
	
	li $t0, 2 
exit:
li $v0, 10 
syscall 