
#PRÁCTICA 3 DE PRINCIPIO DE COMPUTADORES
#Media aritmética con punto flotante

	.data
# Definimos todas las cadenas que imprimiremos por pantalla
cad: .asciiz "Con este programa podrá calcular la media aritmética de 10 numeros en precision simple.\n";
cad2: .asciiz "Introduzca el número ";
cad3: .asciiz ":\n";	
cad4: .asciiz "El resultado de la division aritmetica es: ";
num: .word 10;
contador: .word 0;
uno: .word 1;
	.text
main:

# Cargamos todas las variables necesarias en resgistros temporales
lw $t0, num
lw $t1, contador
lw $t2, uno

# Imprimimos por pantalla la bienvenida
li $v0, 4 
la $a0, cad
syscall

# Establecemos la condición del bucle. Si es cierta, se acaba.
bgt $t1, $t0, finbucle

# Función del bucle
bucle:

# Sumamos 1 al contador
add $t1, $t1, $t2

# Imprimimos por pantalla que el usuario nos introduzca un número
li $v0, 4 
la $a0, cad2
syscall

# Imprimimos por pantalla el número que va a introducir
li $v0, 1 
la $a0, ($t1)
syscall

# Imprimimos por pantalla los dos puntos y el salto de línea
li $v0, 4 
la $a0, cad3
syscall

# El programa recoge el número, que está en $f0
li $v0, 6
syscall

# Suma en precisión simple del número introducido más el anterior
add.s $f12, $f0, $f12

# Vuelve a ejecutar el bucle si no hemos llegado a 10
blt $t1, $t0, bucle

# Función de la división tras acabar el bucle
finbucle:

# Pasamos a un registro flotante el número de números, 10
mtc1 $t0, $f14

# Convertimos el número de números, 10, a precisión simple
cvt.s.w $f8, $f14

# Realizamos la división en precisión simple
div.s $f12, $f12, $f8

# Imprimimos por pantalla el texto de resultado de la división
li $v0, 4 
la $a0, cad4
syscall

# Imprimimos por pantalla el resultado de la división
li $v0, 2
syscall

# Salida limpia del sistema
li $v0, 10
syscall

# FIN