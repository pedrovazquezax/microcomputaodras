processor 16f877      ;Tipo de Procesador utilizar
include <p16f877.inc> ;Libreria

;Definición de variables en memoria
contador equ h'20'
valor1 equ h'21'
valor2 equ h'22'
valor3 equ h'23'
cte1 equ 20h 
cte2 equ 50h
cte3 equ 60h

   org 0               ;Vector de RESET, origen de programa
   goto inicio 
   org 5
   
inicio bsf STATUS, 5   ;Hace cambio al Banco 1
       bcf STATUS, 6   ;Se configura el puerto B como salida
       movlw h'0'       
       movwf TRISB     ;Configura el puerto B como salida
       bcf STATUS,5    ;Cambio al Banco 0
       clrf PORTB      ;Limpia los bits del PUERTO B

loop2  bsf PORTB,0     ;Prende el bit 0 del PUERTO B
       call retardo    ;Llamada a rutina, genera un Delay
       bcf PORTB, 0    ;Apaga el bit 0 del PUERTO B
       call retardo    ;Llamada a rutina, genera un Delay
       goto loop2 
	
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
