#Funzione Differenza di Somme 
.data

.text

main:
	li $a0, 2 #f
	li $a1, 3 #g
	li $a2, 4 #h
	li $a3, 5 #i
	jal diffofsums #diffofsums( f,g,h,i )	
	
	#Salvataggio  + stampa del valore 
	move $a0, $v0
	li $v0, 1
	syscall 
	
	li $v0, 10
	syscall

diffofsums:

	add $t0, $a0, $a1 #f + g
	add $t1, $a2, $a3 #h + i
	sub  $v0, $t0, $t1 #(f+g) - (h+i)
	jr $ra