	.data
myfl1:
	.float 0.67 
myfl2:	
	.float -1.23
myfl3:
	.double 1.98892e30 #masa del sol en Kg
myfl4:	
	.double 1.6762158e-27 #masa de un proton en Kg
res1:
	.space 4
res2:
	.space 8
	.text
main:
	lwc1	$f2,myfl1 #myfl1: 0x10010000
	lwc1	$f4,myfl2 #myfl2: 0x10010004
	add.s	$f0,$f2,$f4
	swc1	$f0,res1 #res1: 0x100100018 (0x10010000+24d) (prec.simple)
	ldc1	$f2,myfl3 #myfl3: 0x10010008
	ldc1	$f4,myfl4 #myfl4: 0x10010010
	add.d	$f0,$f2,$f4
	sdc1	$f0,res2 #res2: 0x10010001C (0x10010000+28d) (prec.doble)
	li	$v0,10
	syscall
	
	
	