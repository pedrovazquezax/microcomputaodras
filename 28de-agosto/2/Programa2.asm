processor 16f877      
include <p16f877.inc> 

valor1 equ h'21'
valor2 equ h'22'
valor3 equ h'23'
cte1 equ 30h 
cte2 equ 50h
cte3 equ 60h

    org 0              
    goto inicio 
    org 5
	
inicio 
	bsf STATUS, 5
	bcf STATUS, 6   
    movlw h'0'
    movwf TRISB     
    bcf STATUS,5    
    clrf PORTB     

loop2  
	movlw h'ff'     
    movwf PORTB     
    call retardo 
    movlw h'00'     
    movwf PORTB     
    call retardo    
    goto loop2 
	
retardo 
	movlw cte1     
	movwf valor1

tres 
	movwf cte2
    movwf valor2

dos  
	movlw cte3
    movwf valor3

uno  
	decfsz valor3 
    goto uno 
    decfsz valor2
    goto dos
    decfsz valor1   
    goto tres
    return
end 