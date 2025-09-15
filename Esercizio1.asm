.data
	MyMessage: .asciiz "Hello, World!\n"
.text
	Main:
		li $v0, 4
		la $a0, MyMessage
		syscall
	Exit:
		li $v0, 10
		syscall
#Le syscall sono delle chiamate al SO, che servono principalmente per operazioni di input e output
