
.data

.text
sum :
 	addi $sp , $sp , -8 # Alloca spazio sullo stack
 	sw $a0 , 4( $sp) # Salva $a0
 	sw $ra , 0( $sp) # Salva $ra
 	addi $t0 , $0 , 2
 	slt $t0 , $a0 , $t0 # a <= 1 ?
 	beq $t0 , $0 , else # no: salta ad else
 	addi $v0 , $0 , 1 # yes : return 1
 	addi $sp , $sp , 8 # Ristora $sp
 	jr $ra # Ritorna
 else :
 	addi $a0 , $a0 , -1 # n = n - 1
 	jal sum # Chiamata ricorsiva
 	lw $ra , 0( $sp) # Ristora $ra
 	lw $a0 , 4( $sp) # Ristora $a0
 	addi $sp , $sp , 8 # Ristora $sp
 	add $v0 , $a0 , $v0 # n + sum (n -1)
	jr $ra # Ritorna