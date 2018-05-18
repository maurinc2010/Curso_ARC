.MODEL SMALL                        ;definicion del modelo de memoria a usar 
.STACK                              ;definicion del segmento de pila
.DATA                               ;segmento de datos 
     VAR1   DW 0
     dato   db 0
     VAR3   DW 0
     MSM1    DB  "2343423",13,10, '$'
.CODE    

MOV AX, @DATA
MOV DS, AX

INICIO:
    
MOV     AL,0X81     ; CONFIGURACION TODO SALIDA
OUT     0XC8,AL

;MOV     AL,0XAA
;OUT     0X08,AL     ;PUERTO A
;MOV     AL,0XAA
;OUT     0X48,AL     ;PUERTO B
;MOV     AL,0XAA
;OUT     0X88,AL     ;PUERTO C
 

    mov     dato,0x38
    call    write_comando
    mov     dato,0x0D
    call    write_comando
    mov     dato,6
    call    write_comando
    mov     dato,1
    call    write_comando
    mov     dato,0xc0
    call    write_comando
    ;jmp     FIN 
PORT:       
    IN  AL,0X88  ;LEER PUERTO C 
    MOV dato,al
call    write_dato
JMP PORT
linea:
    MOV     bx,0
    MOV     cx,9
linea1:     
    MOV     AL,MSM1[BX] 
    MOV     dato,AL
    mov     var3,cx 
    CALL    write_dato
    INC     BX  
    mov     cx,var3
    LOOP    linea1 
fin1:
    jmp     fin1     
   
delay: 
    mov     var1,0x50
    mov     cx,0x50
    jmp     ciclo2
    
ciclo1:  
    mov     var1,cx
    mov     cx,0x50
ciclo2:
    loop    ciclo2
    mov     cx,var1
    loop    ciclo1
    ret   

write_comando:   
    mov     al,0
    out     0x48,al 
    mov     aL,dato
    out     0x08,aL 
    mov     al,0x02
    out     0x48,al
    call    delay
    mov     al,0x00
    out     0x48,al
    call    delay
    ret
    
write_dato:   
    mov     al,1
    out     0x48,al 
    mov     aL,dato
    out     0x08,al 
    mov     al,0x03
    out     0x48,al
    call    delay
    mov     al,1
    out     0x48,al
    call    delay
    ret

FIN:
JMP FIN
END 
