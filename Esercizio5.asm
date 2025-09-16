#Funzioni 



.data

.text

	main:
	#jal:permette di chiamare la funzione 
	jal simple
	add $s0, $s1, $s1
	
	li $v0, 10
	syscall
	simple: 
		jr $ra #jr: salterà nel registro salvato, in questo caso $ra
	


