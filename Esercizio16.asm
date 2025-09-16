.data


.text

main
	addi $t0, $zero, $zero #n
	addi $t1, $zero, $zero #i
	addi $t2, $zero, 18 #x
	add $t3, $zero, $zero #y
	
while:
	slt $t4 ,$t1, 32
	beq $t4, $zero, exit
	andi $t3, $t2, 1 #y = x & 1 
	add $t0, $t0, $t3
	srl  $t2, $t2, 1
	add $t1, $t1, 1
	j while 
exit:
	move $a0, $t0
	li $v0, 1
	syscall
	
	li $v0, 10 
	syscall 