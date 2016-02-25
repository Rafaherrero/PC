.data # Seccion declaracion de datos 
cadena: .asciiz "Hola mundoooooooooo \n"; 
numero: .word 7 # variable numero valor inicial 7 
 
 .text # Seccion de codigo de usuario 
main: # La etiqueta main es el inicio 
 
 # para imprimir una cadena de caracteres es necesario 
 # 1º cargar en el registro $v0 un 4. Esto le dice al sistema 
 # que vamos a imprimir una cadena de caracteres 
 # 2º cargamos en $a0 la direccion de inicio de la cadena 
 # 3º invocamos la llamada al sistema 
 li $v0,4 # $v0 = 4 funcion print string 
 la $a0,cadena # Sa0 = direccion de la cadena a imprimir 
 syscall 
 
 # para imprimir un entero es necesario 
 # 1º cargar en el registro $v0 un 1. Esto le dice al sistema 
 # que vamos a imprimir un valor entero 
 # 2º cargamos en $a0 el entero que queremos imprimir 
 # 3º invocamos la llamada al sistema 
 li $v0,1 # $v0 = 4 funcion print_int 
 lw $a0,numero # Sa0 = entero a imprimir 
 syscall 
 
 # se hace una salida limpia del sistema (exit es codigo 10) 
 li $v0, 10 
 syscall 
# END