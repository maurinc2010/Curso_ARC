;.model small
;.stack
;.data      

org 100h
;jmp START


;.code
START:      

   ;  Mov  Ax, @Data           ; Permite el acceso a los datos inicializando
   ;  Mov  Ds, Ax              ; el registro DS con la direcci¢n adecuada
                              ; del segmento de datos (@Data).
    ; Push Ds                  ; ES=DS, se inicializa empujando el valor
    ; Pop  Es                  ; de DS a la pila y extrayndolo en ES.   

; Desplegar mensaje
MOV DX, OFFSET MENSAJE
MOV AH, 09H
INT 21H  

MOV DX, OFFSET MSM1
MOV AH,09H
INT 21H

MOV DX, OFFSET MSM2
MOV AH,09H
INT 21H     
 
;captura el teclado asta precionar enter se almacena en key          
mov dx, offset key
MOV AH,0AH
INT 21H 

;Convertir de ascci a entero. 
MOV     VAR,0   
xor     cx,cx
MOV     CL,key[1]
XOR     DI,DI 
CONVER:
CALL    POWER  
POP     CX  
MUL     key[DI]
      

POWER:
    PUSH CX
    MOV  AX,1
    DEC  CX  
    MOV  BX,10
CICLO:
    MUL  BX  
    LOOP CICLO   
    MOV  BX,AX
    RET    
    
MENSAJE DB "        CONTADOR BINARIO ",13,10, '$'
MSM1    DB "    CONVERSOR BINARIOA A BCD ",13,10, '$'
MSM2    DB 10,10,"INGRESE BASE DE CONTEO = ",'$'
key     DB 6,0,6,'$'   ;cadena usada para guardar los datos ingresados por teclado 
var     DW ?       

endp   

end
