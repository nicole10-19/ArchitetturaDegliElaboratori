#Fibonacci (Funzioni Ricorsive ) 



.data

.text
main:
	li $a0, 4
	jal fib
	
	move $a0, $v0
	
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
fib: 
	bgt $a0, 1, recurse #Se $a0 eì maggiore di 1 
	move $v0, $a0       #In $v0 mi aspetto il risultato della funzione
	jr $ra 

recurse:
	sub $sp, $sp, 12
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	
	addi $a0, $a0, -1
	jal fib 
	
	sw $v0, 8($sp)
	
	lw $a0, 4($sp)
	addi $a0, $a0, -2
	jal fib 
	
	lw $t0, 8($sp)
	add $v0, $v0, $t0
	
	lw $ra, 0($sp)
	addi $sp, $sp, 12
	
	jr $ra
	
	