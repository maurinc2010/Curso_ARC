                                                                          
.MODEL SMALL 
                       ;definicion del modelo de memoria a usar 
.STACK                              ;definicion del segmento de pila

.DATA                               ;segmento de datos
   
   PORT1    DW  100h
   PORT2    DW  101h
.CODE
INICIAR:       
     MOV     AX,0080h   
     MOV     DX,00C8H
     out     DX,AX    
     ;JMP     INICIAR
    MOV      al,0
    mov      ah,0
debud:
    MOV     DX,0X48     ; corresponde al puerto b
    mov     al,0x5b
    out     DX,al     
    mov     dx,0x88     ; corresponde al puertdo c
    out     DX,Al
    mov     dx,0x08     ;corresponde al puerto a
    mov     al,0x5b
    out     DX,al       
    inc     al
    jmp     debud                  
    
                       
DELAY1 PROC 
    MOV AX,100       
    MOV CX,AX
CASSS1:   
    DEC CX
    JNZ CASSS1 
    ret
DELAY1 ENDP 
end   