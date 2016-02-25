 .data 
size: .word 4 
x: .word 1, 3, 5, 7 
y: .word 2, 4, 6, 8 

.text 

main: 
 la $a0, x # $a0 <-- dirección base del array x 
 la $a1, y # $a1 <-- dirección base del array y 
 lw $a2, size # $a2 <-- tamaño del array = n 
 jal ip # invoca rutina ip, guarda en $ra la dir. de vuelta 
 move $a0, $v0 # escribe en consola el resultado (que ip dejó en $v0) 
 li $v0, 1 
 syscall 
 #-----------------------#Fin de la ejecución del programa 
 li $v0, 10 
 syscall 
 
ip: li $v0, 0 # inicializa sum a 0. $v0 guardará el resultado 
 # que devuelve la rutina 
 li $t3, 0 # $t3: índice de los elementos del array (i) 
ip1: bge $t3, $a2, ipx # sale cuando i >= n 
 lw $t0, 0($a0) # $t0 <-- a0[i] 
 lw $t1, 0($a1) # $t1 <-- a1[i] 
 mul $t2, $t0, $t1 
 add $v0, $v0, $t2 # sum <-- sum + a0[i] * a1[i] 
 addi $a0, $a0, 4 # incrementa los punteros 
 addi $a1, $a1, 4 
 addi $t3, $t3, 1 # i++ 
 b ip1 # cierra bucle (salto incond. a ip1) ipx: jr $ra # retorna al invocador 
 #-------------------------------# 
 
