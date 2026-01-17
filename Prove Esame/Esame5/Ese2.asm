.data

array0: .word 0, 1, 2, 4, 4, 6, 6, 7

array1: .word 0:8

.text
	addi $t0, $zero, 0 
	lw $s0, array0($t0)
	sw $s0, array1($t0)
	
	addi $s1, $zero, 1 # i = 1
	addi $s2, $zero, 1 # j = 1 
	addi $t1, $zero, 8	# per condizione ciclo while

while:
	slt	$t2, $s1, $t1
	beq 	$t2, $zero, end
	
	addi $t2, $s1, -1	# i - 1
	sll $t2, $t2, 2		#(i - 1 ) * 4
	lw $s4, array0($t2)
	
	sll $t2, $s1, 2		#i * 4 
	lw $s3, array0($t2)
	
	beq $s3, $s4, skip
	
	sll $t3, $s2, 2	# j * 4
	add $t4, $zero , $s3
	sw $t4, array1($t3)
	
	addi $s2, $s2, 1	# j = j + 1
skip:
	addi $s1, $s1, 1	# i = i +1
	j while
end:
	li $v0, 10
	syscall
	 