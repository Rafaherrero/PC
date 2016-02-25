
# PRACTICA 2 PRINCIPIO DE COMPUTADORAS 
# Suma dos número enteros y almacena el resultado 
 
 .data # Seccion declaracion de datos 
op1: .word 80 # variable op1 con valor inicial 0 
op2: .word 12 # variable op2 con valor inicial 0 
suma: .word 0 
resta: .word 0
multbajo: .word 0
multalto: .word 0
divis: .word 0
resto: .word 0
cadsuma: .asciiz "El resultado de la suma es: "; 
cadresta: .asciiz "\nEl resultado de la resta es: "; 
cadmult: .asciiz "\nEl resultado de la multiplicacion es: "; 
caddiv: .asciiz "\nEl resultado de la division es: "; 
cadresto: .asciiz "\nEl resultado del resto de la division es: "; 


 .text # Seccion de codigo de usuario 
main: # La etiqueta main es el inicio 
 
 lw $s0, op1 # cargo en el registro $s0 el valor de op1 
 lw $s1, op2 # cargo en el registro $s1 el valor de op2 
 
 # suma de enteros 
 add $s2, $s0, $s1 
 sw $s2, suma 

 # resta de enteros
 sub $s3, $s0, $s1
 sw $s3, resta

 # multiplicacion de enteros
 mult $s0, $s1

 mfhi $t0
 mflo $t1

 sw $t0, multalto
 sw $t1, multbajo

 # division de enteros
 div $s0, $s1

 mfhi $t0
 mflo $t1

 sw $t0, resto
 sw $t1, divis

 # imprimimos los resultados por pantalla de la suma
 li $v0, 4 
 la $a0, cadsuma
 syscall
 li $v0, 1
 lw $a0, suma
 syscall

 # imprimimos los resultados por pantalla de la resta
 li $v0, 4 
 la $a0, cadresta
 syscall
 li $v0, 1
 lw $a0, resta
 syscall

 # imprimimos los resultados por pantalla de la multiplicación
 li $v0, 4 
 la $a0, cadmult
 syscall
 li $v0, 1
 lw $a0, multbajo
 syscall

 # imprimimos los resultados por pantalla de la división
 li $v0, 4 
 la $a0, caddiv
 syscall
 li $v0, 1
 lw $a0, divis
 syscall

 # imprimimos los resultados por pantalla del resto de la división
 li $v0, 4 
 la $a0, cadresto
 syscall
 li $v0, 1
 lw $a0, resto
 syscall
 
 # se hace una salida limpia del sistema (exit es codigo 10) 
 li $v0, 10 
 syscall 
# FIN
