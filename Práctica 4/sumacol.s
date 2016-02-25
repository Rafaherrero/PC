# PRACTICA 4. PRINCIPIOS DE COMPUTADORES
# SUMA DE LOS ELEMENTOS DE UNA COLUMNA
# autor: 
# la matriz tiene dimension mxn

m = 4		# numero de filas de  m1
n = 5		# numero de columnas de m1
size = 4	# tamano de cada elemento


			.data
m1:			.word	1,2,3,4,5
			.word	1,2,3,4,5
			.word	1,2,3,4,5
			.word	1,2,3,4,5
            
col:                    .word   3 # variable con la columna que queremos sumar
                                  # la primera fila es la fila 0
                                  # la primera columna es la columna 0
                                  # la suma de los eltos de la col 3 es 16
			
			.text
main:
			
			# RELLENA EN ESTE HUECO PARA REALIZAR TU IMPLEMENTACION

			# salida limpia del sistema
			li	$v0,10
			syscall
			