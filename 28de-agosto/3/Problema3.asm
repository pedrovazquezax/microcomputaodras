processor 16f877      ;Tipo de Procesador utilizar
  include <p16f877.inc> ;Libreria

valor1 equ h'21'
valor2 equ h'22'
valor3 equ h'23'
cte1 equ 10h           ;Este valor se puede modificar para
                       ;la duración del DEALY
cte2 equ 50h
cte3 equ 60h

       org 0           ;Vector de RESET, origen de programa
       goto inicio 
       org 5
	   
inicio bsf STATUS, 5  
       bcf STATUS, 6   ;Cambio a BANCO1
       movlw h'0'
       movwf TRISB     ;Configurar puerto B como salida
       bcf STATUS,5    ;Cambio BANCO 0
       clrf PORTB      ;Limpia los bits del PUERTO B
loop2 
       movlw h'80'     ;Carga en W en valor inicial de 80h=1000000b
       movwf h'20'     ;Mueve el valor de W a la Localidad 20h
CICLO: 
       movfw h'20'
       movwf PORTB     ;Mueve al puerto B lo que hay en 20h
       rrf h'20',1     ;Hace un rotamiento a la Izquierda 
                       ;y guarda en 20h
       call retardo 
       btfss h'20',0   ;Comprueba si el valor que hay en 20h es 1h
       goto CICLO      ;NO, repite el ciclo para hacer rotamiento
       goto loop2      ;SI, reinicia la secuencia
       
	
retardo 
     movlw cte1        ;Rutina que genera un DELAY 
     movwf valor1
tres movwf cte2
     movwf valor2
dos  movlw cte3
     movwf valor3
uno  decfsz valor3 
     goto uno 
     decfsz valor2
     goto dos
     decfsz valor1   
     goto tres
     return
     end 