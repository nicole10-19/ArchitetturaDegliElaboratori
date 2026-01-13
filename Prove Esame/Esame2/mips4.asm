# Programma che calcola il massimo fra 3 interi. Senza utilizzo di macro (bge...)




.data


.text
main:
	addi $s0, $zero, 4 # a = 4
	addi $s1, $zero, 10 # b = 10 
	addi $s2, $zero, 8 # c = 8
	
	addi $s3, $s2 , 0 #x = c
	
if:
	slt $t0, $s1, $s0 #b<a
	slt $t1, $s2, $s0 #c<a
	
	and $t2, $t0, $t1 # &&
	
	bne $t2, $zero, label
	slt $t3, $s2, $s1 # c < b
	beq $t3, $zero, end
	addi $s3, $s1, 0
	j end
label:
	addi $s3, $s0, 0 #x = a 
	
end:
	li $v0, 10 
	syscall 
	
	