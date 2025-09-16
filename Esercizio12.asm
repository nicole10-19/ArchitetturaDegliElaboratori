#Prova di laboratorio da Esame 

#Programma che calcola il prodotto di due numeri naturali in una CPU a 32 bit 
#priva di moltiplicatore, senza l'utilizzo di macro (bge...). Vengono ignorati eventuali problemi di overflow




.data


.text

main:
#salvo x in $s0, y in $s1,  p in $s2,  temp in $t0

addi $s0, $zero , 16
addi $s1, $zero, 18
add $s2, $zero, $zero
add $s3, $zero, $zero #i
add $t0, $zero, $zero

addi $t1, $zero, 32
whileloop: 
	slt $t2, $s3, $t1 #i<32
	beq $t2, $zero, endwhile
	andi $t0, $s1, 1 #temp = y & 1, un solo & sta compara i bit e controlla se sono uguali 
	beq $t0, $zero, skip #se temp = 0 salta 
	add $s2, $s2, $s0 #p = p + x

skip:
	srl $s1, $s1, 1
	sll $s0, $s0, 1
	addi $s3, $s3, 1
	j whileloop
endwhile:

	li $v0, 10
	syscall
