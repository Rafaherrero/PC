#PRÁCTICA 5 DE PRINCIPIO DE COMPUTADORES
#Cálculo del producto escalar de vectores

#Declaramos el tamaño de los elementos, así como el 
#número de elementos de los vectores
size = 4		
elementos = 10 	

			.data
			
#Vectores de los que calcularemos su producto escalar
vector1:		.word	0,3,5,6,8,1,3,2,5,9	
vector2:		.word	1,2,0,4,1,1,1,2,2,1		

#Texto quer imprimiremos por pantalla
texto: .asciiz "El resultado del producto escalar es: "			

			
			.text 
			           
main: 
#Cargamos las variables que utilizaremos
 la $a0, vector1
 la $a1, vector2 
 li $t5, size 
 li $t4, elementos
 
 li $v0, 0
 li $t3, 0 

#Saltamos a la eitqueta "pescalar" 
 jal pescalar
 
 #Movemos el resultado a un registro para poder utilizarlo posteriormente
 move $a3, $v0
 
 #Imprimimos por pantalla el "texto"
 li	$v0,4			
 la	$a0,texto	
 syscall
 
 #Movemos el resultado a el registro v0 para imprimirlo por pantalla
 move $a0, $a3
 li $v0, 1 
 syscall 
 
#Salida limpia del sistema
 li $v0, 10 
 syscall
 
 
 pescalar: 
				#Si el número de elementos es menor que el número de elementos totales,
				#salta a "recur", si no, returna a ra
				blt $t3, $t4, recur
				jr $ra
				
				recur:
				
				#Creamos la pila y metemos ra del programa principal
				addi $sp, $sp, -4
				sw $ra, 0($sp)
				
				#Cargamos los vectores en la posición que necesitemos				
				lw $t0, 0($a0) 
				lw $t1, 0($a1)
				
				#Multiplicamos los números de ambos vectores,
				#y lo guardamos en t2
				mul $t2, $t0, $t1 
				
				#Sumamos el resultado de la multiplicación, con el resultado
				#de la multiplicación anterior
				add $v0, $v0, $t2 
				
				#Aumentamos los punteros de los vectores
				add $a0, $a0, $t5 
				add $a1, $a1, $t5 
				
				#Añadimos un 1 al contador de elementos ya analizados
				addi $t3, $t3, 1
				
				#Volvemos a "pescalar" para analizar la condicion del bucle
				jal pescalar
				
				#Si ya hemos terminado las multiplicaciones, cargamos el ra
				#de la pila, "eliminamos" la pila, y volvemos al programa
				#principal
				lw $ra, 0($sp)
				addi $sp, $sp, 4
				jr $ra
 
