#Programma che calcola il massimo fra 3 interi. L’esercizio deve essere risolto senza 
# utilizzare macro (bge ....).


.data


.text

main:
	addi $s0, $zero, 4	# a = 4
	addi $s1, $zero, 10	#b = 10 
	addi $s2, $zero, 8	# c = 8
	
	add $t0, $zero, $s2	# x = c 
	
	sgt $t1, $s0, $s1
	bne $t1, $zero, else
	
	sgt $t1, $s0, $s2
	bne $t1, $zero, else
	
	move $t0, $s0
else:
	sgt $t1, $s1, $s2
	bne $t1, $zero, end
	
	move $t0, $s1

end:
	li $v0, 10
	syscall
	