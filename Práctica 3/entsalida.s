# Ejemplo de entrada salida
        	.data        	# Seccion declaracion de datos
        	 	
cad1:	.asciiz "Ejemplo de cadena\n";
       
                      
        	.text			# Seccion de codigo de usuario	
main:                	# La etiqueta main es el inicio

	# las siguientes lineas escriben por la consola una cadena
	li	$v0,4		# $v0 = 4 funcion print string
	la	$a0,cad1	     # Sa0 = direccion de la cadena a imprimir
	syscall

	# las siguientes lineas leen un entero por la consola
	# el entero leido tras leerlo queda en $v0, por lo que
	# despues es conveniente moverlo a otro registro, por 
	# ejemplo en $s0
	li	$v0,5		# $v0 = 5 lee un entero
	syscall
	move	$s0,$v0		# dejo en $s0 el valor de $v0

	# las siguientes lineas escriben por consola un numero entero
	# estamos suponiendo que en $s0 tenemos el entero que queremos
	# imprimir. Si no está en un registro podremos cargar el
	# argumento con las instrucciones li $a0,valor_inmediato
	# o lw $a0,variable
	# la funcion print_int es $v0 = 1
	li	$v0,1
	move $a0,$s0
	syscall

	# las siguientes lineas leen un real por la consola
	# el real leido se queda en el registro del coprocesador $f0, por
	# lo que después de llerlo lo muevo a otro registro, por ejemplo el
	# $f20
	li	$v0, 6	     # $v0 = 6 funcion leer flotante simple precision.
	syscall		     # el sigle leido se queda en $f0
	mov.s $f20,$f0     # almaceno en $f20 el valor leido
		
	
	# las siguientes lineas escriben un real por la consola
	# el sistema espera en el registro $f12 el flotante a
	# escribir, por lo que tendrás que cargarlo con el 
	# valor adecuado
	li	$v0,2		# $v0 = 2 funcion print_float, espera en $f12 el flotante a imprimir
	syscall
	
 	# codigo que realiza una salida limpia del sistema	  	# se hace una salida limpia del sistema (exit es codigo 10)
	li $v0, 10
     syscall
# FIN PROGRAMA     

