.MODEL SMALL                        ;definicion del modelo de memoria a usar 
.STACK                              ;definicion del segmento de pila
.DATA                               ;segmento de datos  

    ;-----------------------------------------------------
    ;---TEXTOS DE LA PRESENTACION INICIAL
    MSM1    DB  "    CONVERSOR DE ASCII A BINARIO ",13,10, '$'
    MSM2    DB   "INGRESE NUMERO",13,10,'$' 
    key     DB 6,0,6,'$'   ;cadena usada para guardar los datos ingresados por teclado 
    ;---------------------------------------------------------  
    
.CODE 
INICIO:        
    MOV AX,@DATA
    MOV DS,AX
    MOV ES,AX   
    ;MOV AL,13H
    ;MOV AH,0  
    ;MOV BX,0
   ; INT 10H  
    
                
    MOV  DX,OFFSET MSM1
    CALL PRINT_MSM
    
    MOV  DX,OFFSET MSM2
    CALL PRINT_MSM         
    
    JMP  FIN
    
  


PRINT_MSM:
	;mov dx, offset MSM1
	mov ah, 9
	int 21h
	ret

FIN:	
  END
