#Esercizio da esame 
#Nome Cognome Matricola
#Calcolare il massimo fra 3 interi, senza l'utilizzo di macro (bge...)

.data

.text

main:
	 addi $s0,$zero, 4 #a
	 addi $s1,$zero, 10 #b
	 addi $s2,$zero, 8 #c
	 add $s3, $zero, $s2 #x

if:
	slt $t0, $s1, $s0 #slt: se $s1 e' piu' piccolo di $s0, allora $t0 = 1 
				#altrimenti $t0 = 0, in questo caso a>b?
	slt $t1, $s2, $s0 # a>c?
	and $t0, $t0, $t1 # a>b && a>c
	
	# se slt vale zero salta al ramo else 
	beq $t0, $zero, else
	add $s3, $zero, $s0
	j endif #Per non eseguire anche else 
else:
	slt $t0, $s2, $s1 #b > c 
	beq $t0, $zero, endif
	add $s3, $zero, $s1 #x=b

endif: 	
	add $a0, $zero, $s3
	addi $v0, $zero, 1
	syscall
	#Termino programma
	li $v0, 10
	syscall 

