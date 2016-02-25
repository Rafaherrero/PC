
#PRACTICA 6 DE COMPUTADORES
#Ordenacion de vectores

#Declaramos número de elementos, tamaño de los mismos y número de vectores
m = 5
size = 4
nvect = 2

		.data

#Vectores que utilizaremos, además de uno vacío con 10 elementos
vec1:	.word	-2, -1, 5, 8, 10
vec2:	.word	1, 3, 6, 7, 9
vec3: 	.word	0,0,0,0,0,0,0,0,0,0

#Texto que imprimiremos por pantalla, así como un "espacio"
cad:	.asciiz "El resultado de la ordenación de vectores es: "
espacio: 	.asciiz ", "

		.text

main:

#Cargamos las variables necesarias
la $a1, vec1
la $a2, vec2
la $t6, vec3
li $t0, m
li $t1, size
li $t2, nvect

#Multiplicamos el número de elementos por el número de vectores
#para saber la cantidad de elementos
mult $t0, $t2
mflo $s0

condicion:
		
		#Cargamos los vectores en la posición que necesitemos
		lw $t4, 0($a1)
		lw $t5, 0($a2)
		
		#Condición del bucle, no llegar a los 10 elementos
		beq $s0, $t3, salida1
		
		#Condición del bucle, si el primer elemento es más pequeño
		ble $t4, $t5, cd1
		
		#Condición del bucle, si el segundo elemento es más pequeño
		blt $t5, $t4, cd2
		
		cd1:
		
		#Si ya se han analizado 5 elementos del vector 1, saltamos a "prueba"
		beq $s1, $t0, prueba
		
		#Guardamos el elemento del primer vector porque es más pequeño
		sw $t4, 0($t6)
		
		#Movemos los punteros tanto del primer vector, como de t6, donde
		#vamos almacenando los valores del vector final
		add $t6, $t6, $t1
		add $a1, $a1, $t1
		
		#Sumamos un 1 a los contadores de los elementos totales, y de los elementos
		#del vector analizado
		addi $t3, $t3, 1
		addi $s1, $s1, 1
		
		#Saltamos a "condicion" para saber cual es más pequeño
		j condicion
		
		cd2:
		
		#Si ya se han analizado 5 elementos del vector 2, saltamos a "cd1"
		beq $s2, $t0, cd1
		
		#Guardamos el elemento del segundo vector porque es más pequeño
		sw $t5, 0($t6)
		
		#Movemos los punteros tanto del segundo vector, como de t6, donde
		#vamos almacenando los valores del vector final
		add $t6, $t6, $t1
		add $a2, $a2, $t1
		
		#Sumamos un 1 a los contadores de los elementos totales, y de los elementos
		#del vector analizado
		addi $t3, $t3, 1
		addi $s2, $s2, 1
		
		#Saltamos a "condicion" para saber cual es más pequeño
		j condicion

		prueba:
		
		#Si hemos analizado 5 elementos de ambos vectores, saltamos a "salida1"
		beq $s1, $s2, salida1
		
		#Si no hemos llegado a 5 - 5, saltamos a "cd2·
		j cd2
		
salida1:

#Imprimimos la cadena
li $v0, 4
la $a0, cad
syscall

#Limpiamos las variables y cargamos en $t4 el vector de los elementos
#ya ordenados
li $t3, 0
li $t4, 0
la $t4, vec3

imparray:

#Bucle que nos imprimirá todos los elementos, excepto que se llegue
#al límite de elementos
beq $t3, $s0, salida2

#Imprimimos un entero, en este caso, el del elemento que nos apunte el
#puntero del vector de los elementos ordenados
li $v0, 1
lw $t8, 0($t4)
move $a0, $t8
syscall

#Imprimimos un "espacio" para que no salgan todos los elementos pegados
li $v0, 4
la $a0, espacio
syscall

#Sumamos un 1 a la cantidad de elementos ya mostrados, y aumentamos
#el puntero del vector
addi $t3, $t3, 1
add $t4, $t4, $t1

#Volvemos a ejecutar el bucle
j imparray

salida2:

#Salida limpia del sistema
li $v0, 10
syscall
