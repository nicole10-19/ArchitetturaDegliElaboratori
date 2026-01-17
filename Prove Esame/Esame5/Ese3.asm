.data


.text 
main:
	addi $s0, $zero, 7
	addi $s1, $zero, 4
	
	move $a0, $s0
	move $a1, $s1
	
	jal vm
	move $s2, $v0
	
	li $v0, 10
	syscall
vm:
	add $s0, $a0, $a1
	srl $v0, $s0, 1
	
	jr $ra
	