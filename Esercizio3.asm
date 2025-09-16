 .data
 	stringa: .asciiz
 	.space 5
 	#stringa conterrà una stringa di massimo 5 caratteri 
 	separatore: .asciiz "\n"
 
 .text 
 	#Scegliamo la syscall 8 per leggere una stringa 
 	li $v0, 8
 	#Viene caricato l'indirizzo del buffer dove salvare la stringa
 	la $a0, stringa
 	#Decidiamo di leggerre al massimo 5 caratteri 
 	li $a1, 5
 	syscall
 	
 	#La stringa digitata dall'utente verrà salvata in stringa
 	
 	
 	
 	li $v0, 4
 	#La syscall 4 serve per stampare una stringa 
 	move $t0, $a0
 	la $a0, separatore
 	syscall
 	
 	
 	move $a0, $t0
 	syscall
 	