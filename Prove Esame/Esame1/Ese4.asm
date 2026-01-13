# Programma per capire la differenza tra & e &&


.data




.text
main:
	addi $t0, $zero, 9
	addi $t1, $zero, 6
	addi $t2, $zero, 0 
	
	#if (x & y) , bit a bit 
	and $t3, $t0, $t1
	beq $t3, $zero, else
	addi $t2, $zero, 1
	j end 

else:
	#if(x && y) , entrambi diversi da 0 
	beq $t0, $zero, end
	beq $t1, $zero, end
	addi $t2, $zero, 2
	
end:
	li $v0, 10
	syscall
	