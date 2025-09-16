#ForLoop
#Tradurre un ciclo for da C in Assembler 

#Lo stesso codice può essere utilizzato anche per un while loop 

.data



.text
main:
	#La variabile int i la salvo in $s0
	li $s0, 0
	li $s1, 10
forloop:

	#Se $s0 è minore o uguale a $s1
	#beq : Branch if Equal
	beq  $s0, $s1, exit
	add $a0, $s0, $zero
	li $v0, 1
	syscall
	addi $s0, $s0, 1 
	j forloop
exit:
	
	li $v0, 10
	syscall
	#La systemcall 10 ci deve essere sempre alla fine per terminare il programma
	

