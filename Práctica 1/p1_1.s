	.data
micadena:
	.asciiz "\nReduced Instruction Set Computer\n"
midato1:
	.word	0xA2B1C3E0
	.text
main:	
	la	$t0,midato1 #midato1: direccion 0x10010024
	lbu	$t1,($t0) #Carga en el registro t1 el byte sin signo situado en la dirección almacenado en $t0
	lw	$a0,($t0)
	li	$v0,1
	syscall	#Imprime el entero guardado en midato1
	la	$a0,micadena #micadena: direcccion 0x10010000
	li	$v0,4
	syscall #Imprime en la consola la cadena apuntada por micadena
	li	$v0,10
	syscall
	