#Programma ceh calcola il numero di uni presenti in un intero a 32 bit 

.data 


.text
main:
	addi $s0, $zero, 0 # n = 0
	addi $s1, $zero, 0 # i = 0
	addi $s2, $zero, 18 # x = 18 
	addi $s3, $zero, 32 # verifica per il ciclo while
	
	
while :
	slt	$t0, $s1, $s3
	beq	$t0, $zero, exit
	andi	$s4, $s2, 1 # y = x & 1
	addi	$s0, $s0, $s4
	srl 	$s2, $s2, 1
	addi	$s1, $s1, 1
	j while

exit:
	li $v0, 10 
	syscall 