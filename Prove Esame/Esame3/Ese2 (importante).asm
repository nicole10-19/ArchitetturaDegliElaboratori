.data



.text
main: 
	addi $s0, $zero, 16 # x = 16
	addi $s1, $zero, 0 # y = 0 
	addi $s2, $zero, 0 # i = 0 
	addi $s3, $zero, 32 # limite ciclo 
	
loop:
	slt $t0, $s2, $s3	# t0 = 1 se i < 32
	beq $t0, $zero, end	# se i >= 32 -> esci
	
	andi $t1, $s0, 1	# t1 = x & 1
	add $s1, $s1, $t1	# y = y (x & 1)
	
	srl $s0, $s0, 1		#x = x >> 1
	
	addi $s2, $s2, 1	# i ++
	j loop
	
end:	
	andi $s4, $s1, 1	#p = y % 2 --> in binario un numero è pari se il suo ultimo 
				#  bit è 0, dispari se è 1 , quindi è come se lo traducessimo in y & 1
	li $v0, 10 
	syscall 
	
	
	