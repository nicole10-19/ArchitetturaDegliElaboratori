#Ricerca del massimo in un array da C ad Assembler 

## include < stdio .h >

#int max ( int a [] , int dim ) {
#int max = NULL ;
#int i;

# for (i = 0; i < dim ; i ++) {
#    if ( max < a [i ]) {
#        max = a [i ];
#    }
#}
#return


.data

#NOTABENE : L'array viene salvato come array di parole (4 byte per parola) 
#	    quindi ogni volta che devo spostarmi di una cella devo moltiplicare per 4 
#	    (vedi riga 65) tramite l'istruzione sll
a: .word 10, 11,13, 14, 17, 9, 7, 1, 4, 99
stampa: .asciiz "\nIl massimo dell'array e' "

.text 

main:
	#massimo in $s0
	la $a0, a
	li $a1, 10 
	jal massimo
	move $s0, $v0 
	 
	 la $a0, stampa
	 li $v0, 4
	 syscall 
	 
	 move $a0, $s0
	 li $v0, 1
	 syscall
	 
	 li $v0, 10 
	 syscall
massimo:

	#gestione dello stack
	addi  $sp, $sp, -20  #Mi servono 5 celle quindi 5*4 byte
	sw  $s4, 16($sp)
	sw $s3, 12($sp)
	sw $s2, 8($sp)
	sw $s1, 4($sp)
	sw $s0, 0($sp)
	
	#max salvato in $s0, salvare i in $s1, ...
	li $s0 , 0 #max
	move $s1, $a1 # size
	li $s2, 0 # i
	li $s3, 0 # i*4
	move $s4, $a0
	

loop:
	slt $t0, $s2, $s1 #se i<size allora voglio saltare
	beq $t0 , $zero, endloop 
	sll $s3, $s2, 2 # i * 4
	add $t0, $s4, $s3 # a + i*4
	lw $t1, 0($t0) # Stiamo caricando a[i]
if:
	slt $t2, $s0, $t1 #max < a[i]
	beq $t2, $zero, endif
	move $s0, $t1
endif: 

	addi $s2, $s2, 1 #i++
	j loop
endloop:	
	
	move $v0, $s0
	#gestione dello stack 
	lw $s4, 16($sp)
	lw $s3, 12($sp)
	lw $s2, 8($sp)
	lw $s1, 4($sp)
	lw $s0, 0($sp)
	
	
	jr $ra



