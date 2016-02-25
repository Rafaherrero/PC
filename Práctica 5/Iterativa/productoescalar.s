#PRÁCTICA 5 DE PRINCIPIO DE COMPUTADORES
#Cálculo del producto escalar de vectores

#Declaramos el tamaño de los elementos, así como el 
#número de elementos de los vectores
size = 4		
elementos = 10 	

#Comienza la declaración de variables
			.data
			
#Vectores de los que calcularemos su producto escalar
vector1:		.word	2,3,5,6,8,1,3,2,5,9	
vector2:		.word	1,2,0,4,1,1,1,2,2,1		

#Texto quer imprimiremos por pantalla
texto: .asciiz "El resultado del producto escalar es: "			

			
			.text 
			           
main: 

#Cargamos los vectores, el tamaño de cada elemento y
#el número de elementos en el programa
 la $a0, vector1
 la $a1, vector2 
 li $t5, size 
 li $t4, elementos
 
 #Inicializamos los registros del resultado y el que
 #utilizaremos como contador de los elementos de los que ya
 #se ha realizado el producto escalar
 li $v0, 0
 li $t3, 0 
 
 #Una vez inicializado todo, saltamos a "pescalar" almacenando
 #la dirección de la siguiente instrucción en $ra
 jal pescalar
 
 #El valor del producto escalar, almacenado en $v0, lo movemos
 #a $a3
 move $a3, $v0
 
 #Imprimimos por pantalla el "texto"
 li	$v0,4			
 la	$a0,texto	
 syscall
 
 #Movemos el resultado del producto escalar a $a0
 #para posteriormente imprimirlo por pantalla	
 move $a0, $a3
 li $v0, 1 
 syscall 
 
 #Hacemos una salida limpia del sistema
 li $v0, 10 
 syscall
 
 #Comienzo de la etiqueta pescalar
 pescalar: 
 
 #Se ejecutará el bucle solo si se ha alcanzado
 #el número de elementos del vector
 bge $t3, $t4, salida
 
 #Cargamos en registros temporales los vectores, que se
 #irán moviendo en cada caso 4 bits 
 lw $t0, 0($a0) 
 lw $t1, 0($a1)
 
 #Multiplicamos la el número de los dos vectores y lo almacenamos
 #en el registro temporal $t2 
 mul $t2, $t0, $t1 
 
 #Sumamos el resultado de la multiplicación al resultado anterior
 #y así hasta que salgamos del bucle
 add $v0, $v0, $t2 
 
 #Movemos el puntero de los vectores la posición del tamaño
 #de sus elementos, en este caso, 4
 add $a0, $a0, $t5 
 add $a1, $a1, $t5 
 
 #Añadimos un 1 a la cantidad de elementos que llevamos
 #multiplicados. Al llegar al número de elementos,
 #salimos del bucle
 addi $t3, $t3, 1
 
 #Volvemos a ejecutar el bucle 
 b pescalar
 
 #Cuando lleguemos al límite de elementos del vector, llamamos
 #a salida que nos devolverá la posición antes de ejecutar el
 #bucle por primera vez
 salida:
 jr $ra
