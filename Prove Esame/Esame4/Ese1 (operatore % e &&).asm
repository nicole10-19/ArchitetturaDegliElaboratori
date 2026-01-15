#Programma che calcola il valore del bit di paritá per un numero naturale in una CPU a 32
# bit. L’esercizio deve essere risolto senza utilizzare macro (bge ....). Nota: l’operatore % ritorna
# il resto della divisione intera, questa operazione non esiste nel nostro set di istruzioni assembly,
# ma puó essere realizzata facilmente pensando alla rappresentazione binaria di numeri pari e
# dispari.

.data

.text

main:
	addi $s0, $zero, 16 # x
	addi $s1, $zero, $zero # y 
	addi $s2, $zero, $zero # i
	addi $s3, $zero, $zero # p 

	addi $t0, $zero, 32
while:
	slt $t2, $s2, $t0
	beq $t2, $zero, end
	
	andi $t1, $s0, 1
	addi $s1, $s1, $t1
	
	srl $s0, $s0, 1
	
	addi $s2, $s2, 1
	j while
	
end:
	andi $s3, $s1, 1 