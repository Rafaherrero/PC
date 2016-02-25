		.data
vb1:	.word 4294967290 
vb2:	.word 50
		.text
main:	
	lw $t0, vb1
	lw $t1, vb2
	addu	$t2,$t0,$t1
	add	$t2,$t0,$t1
	li	$v0,10
	syscall
	

	