#Verifica dell'ordinamento di un vettore. Non si devono utilizzare macro.
#NB: Il codice da tradurre non è ottimizzato 


.data

#Dati Statici 
array: .word 0, 1 , 4, 2, 7, 8, 4, 6




.text
#Per scorrere l'array dobbiamo scorrere di 4 byte (l'array è di tipo .word) , 
# $t1 sarà l'indirizzo 
la  $s0, array # Carico in s0 il primo elemento dell'array 
	
add $t0, $zero, $zero # i = 0

addi $s1, $zero, 1 # ord_c = 1
addi $s2, $zero, 1
while:
	slti $t2, $t0, 7 # i < 7
	beq $t2, $zero, endwhile

ifsc:
	
	sll $t1, $t0, 2 
	add $t5, $s0, $t1 # $t5 = base  + i*4
	lw  $t2, 0($t5) # array[i]
	lw $t3, 4($t5) #  array[i+1]
	
	# il contrario di x >= y è x < y
	slt $t4, $t2, $t3 #se array[i] < array[i+1]
	bne $t4, $zero, ifc
	add $s2, $zero, $zero #ord_sc = 0
ifc:
	slt $t4, $t3, $t2 # array[i+1] < array[i]
	beq $t4, $zero, endifc
	add $s1, $zero, $zero # ord_c = 0

endifc:
	addi $t0, $t0, 1
	j while

endwhile:
	
	li $v0, 10 
