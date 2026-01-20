#Programma che verifica se due interi senza segno sono congruenti rispetto a operazioni di
# rotazione dei bit (ovvero esiste un valore di rotazione per cui di una delle due parole per cui tali
# parole risultano uguali). In questo esercizio non devono essere usate macro.


.data 



.text

main:
	addi $s0, $zero, 7	# x = 7
	addi $s1, $zero, 28	# y = 28
	
	
	addi $t0, $zero, 0	# equal = 0
	addi $s2, $zero, 0 	# i = 0
	
	addi $t1, $zero, 32	# condizione ciclo while 
	
while:
	beq $s2, $t1, exit
	bne $t0, $zero, exit 
	
	bne $s0, $s1, loop
	addi $t0, $zero, 1	# equal = 1

loop:	
	andi $t2, $s1, 1
	sll  $t2, $t2, 31
	srl $s1, $s1, 1
	or $s1, $s1, $t2
	addi $s2, $s2, 1
	
	j while 

exit:
	bne $t0, $zero, end
	# Stampa messaggio
end:
	li $v0, 10 
	syscall 
	
	