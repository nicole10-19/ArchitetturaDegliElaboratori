#Prova di Laboratorio da Esame
#Nome Cognome Matricola
#Verifica l'ordinamento di un array, senza utilizzare le macro 


.data
 array: .word 0, 1, 4, 2, 7, 8, 4, 6
.text
main:
	la $s0, array
	#lw $t7, 0($s0) mi da come risultato il primo valore di array
	#lw $t7, 4($s0) mi da come risultato il secondo valore di array ...
	
	addi $s1, $zero, 1 #ord_crescente
	addi $s2, $zero, 1 #ord_strett_crescente
	add $t0, $zero, $zero #i
whileloop:
	slti $t2, $t0, 7
	beq $t2, $zero, endwhile
ifsc: 
	sll   $t1, $t0, 2
	lw $t2, $t1($s0) #array[i]
	addi $t1, $t1, 4 #offset
	lw $t3, $t1($s0)#array[i+1]
	slt  $t4, $t2, $t3 #array[i] < array[i+1]
	bne $t4, $zero, ifc
	add $s2, $zero, $zero
ifc: 
	slt $t4, $t3, $t2  #array[1+1] < array[i]
	beq $t4, $zero, endifc
	add $s1, $zero,$zero


endifc: 	
	addi $t0, $t0, 1
	j whileloop 
	
endwhile:

li $v0, 10 
syscall 
	