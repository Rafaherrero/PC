
#PRÁCTICA 4 DE PRINCIPIO DE COMPUTADORES
#Suma de columnas

#Declaramos número de filas, columnas y  tamaño de cada elemento en bytes
m = 4;
n = 6;
size = 4;

	.data

#Matriz que utilizaremos
m1: .word 1, 2, 3, 4, 5, 6
	.word 1, 2, 3, 4, 5, 6
	.word 1, 2, 3, 4, 5, 6
	.word 1, 2, 3, 4, 5, 6

#Ponemos las frases que imprimiremos por pantalla
cad: .asciiz "Introduce una columna para calcular su suma: "
cad2: .asciiz "La suma de la columna introducida es: "

	.text
	
main:

#Cargamos las variables necesarias
la $t0, m1
li $s0, m
li $s2, n
li $t1, size

#Imprimimos por pantalla "cad", y almacenamos el número de columna introducido en $s1
li	$v0,4			
la	$a0,cad		
syscall	
			
li $v0, 5
syscall
move $s1, $v0

#Restamos 1 al número introducido, ya que trabajaremos desde la columna 0, en vez de 1
addi $s1, -1

#Multiplicamos la columna por el tamaño de cada elemento, y lo guardamos en $t2
mult $s1, $t1
mflo $t2

#Sumamos $t2 a la matriz, de esta manera en $t3 nos encontraremos en la posición
#de la columna, en la primera fila
add $t3, $t0, $t2

#Almacenamos el movimiento que tendremos que hacer para sumar los elementos 
#(columnas por filas) en $s3
mult $s0, $s2
mflo $s3

#Cargamos la posición de la matriz en $t5
lw $t5, 0($t3)

#Sumamos a un contador de filas un 1, para saber en que fila estamos
addi $t6, 1

#Comenzamos un bucle para sumar todos los elementos
bucle:

#Nos desplazamos el número de bytes que nos haga falta para llegar a la siguiente columna
add $t2, $s3, $t2
add $t3, $t0, $t2

#Cargamos el movimiento de bytes necesarios en la matriz en $t4
lw $t4, 0($t3)

#Sumamos el elemento anterior de la matriz, $t5, más el elemento en el que nos situamos
add $t5, $t5, $t4

#Sumamos 1 al contador de filas
addi $t6, 1

#Escribimos la condición del bucle, cuando el número de filas sumadas sea diferente
#al número de filas de la matriz, ejecutará el bucle, sino, saldrá de él
bne $t6, $s0, bucle

#Mostrará por pantalla "cad2" más la suma total de los elementos de la columna
#elegida en esa matriz
li $v0, 4
la $a0, cad2
syscall

li $v0, 1
move $a0, $t5
syscall

#Salida limpia del sistema
li $v0, 10
syscall

#FIN