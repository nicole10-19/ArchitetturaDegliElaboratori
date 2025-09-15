#Esercizio 2
.data
	a: .word 8
	b: .word 9
	c: .word 10, 11, 12 , 13
	
	d: .half 14
	e: .half 15
	f: .half 16, 17 ,18
	
	g: .byte 19
	h: .byte 20
	i: .byte 21, 22, 23
.text
	Main: 
		lw $t0, a
		lh $t1, e
		lb $t3, g
#Le istruzioni lw, lh, lb servono a caricare i dati della memoria nei registri
