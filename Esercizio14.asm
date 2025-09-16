#Prova di Laboratorio Esame 
#Nome Cognome Matricola 
#Calcolo del massimo di un vettore 


.data 
 array: .word 0,1,4,2,7,8,4,6
 
.text 

addi $t0 , $zero, 1 #i
la $s0, array
lw $t1, 0($s0)

add $s1, $zero, $t1 #x

whileloop:
 	slti $t2, $t0, 8# i<8
 	beq $t2, $zero, endwhile
 	
 	sll $t3, $t0, 2
 	lw $t4, $t3($s0)
if:
 	sle $t2, $t4, $s1
 	beq $t2, $zero, endif
	add $s1, $zero, $t4


endif:
	add $t0, $t0,1  # i = i + 1 
	j whileloop	
endwhile:
	li $v0, 10
	syscall 