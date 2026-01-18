

.data

array: .word 0, 1, 4, 2, 7, 8, 4, 6

.text

main:
	lw $s0, array($zero)	# array[0]
	
	addi $s1, $zero, 1	# i = 1 
	addi $t0, $zero, 8	# per ciclo while 
	
	move $s2, $s0	# x = array[0]
	
while:
	slt	$t1, $s1, $t0		# i < 8
	beq	$t1, $zero, end
	
	sll	$t1, $s1, 2 
	lw 	$t2, array($t1)		#array[i]
	
	slt	$t3, $s2, $t2		# x < array[i]
	beq	$t3, $zero, incr
	
	move	$s2, $t2	# x = array[i]

incr:	
	addi $s1, $s1, 1	# i = i + 1
	j while

end:
	li $v0, 10
	syscall