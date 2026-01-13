#Programma che calcola il prodotto di due numeri naturai in una CPU a 32 bit priva di moltiplicatore 
# L'esercizio deve essere svolto senza l'utilizzo macro (bge...). Ignorare eventuali problemi di overflow



.data



.text
main:
	# salvo x in $s0, y in $s1, p in $s3
	# i in $s3, tmp in $t0
	
	addi $s0, $zero , 16
	addi $s1, $zero,  18
	add  $s2, $zero,  $zero
	
	add $s3, $zero, $zero
	add $t0, $zero, $zero
	
	addi $t1, $zero, 32 #salvo 32 in $t1
	
	#Ciclo While
while:
	slt $t2, $s3, $t1 # i < 32
	beq $t2, $zero, endwhile
	
	#tmp = y & (END tra i bit) 1  
	andi $t0, $s1, 1
	
	#if(tmp!=0)
	beq $t0, $zero,skip   #se tmp == 0, salta
	add $s2, $s2, $s0   #p = p+x
skip:
	# shift a destra --> y = y >> 1
	srl $s1, $s1, 1
	
	#shift a sinistra di 1 --> x = << 1
	sll $s0, $s0, 1

	# i = i + 1
	addi  $s3, $s3, 1
	
	j while
	
endwhile:
	li $v0, 10 
	