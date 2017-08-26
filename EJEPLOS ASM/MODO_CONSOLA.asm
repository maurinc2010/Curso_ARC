ORG 100H
JMP START
MENSAJE DB "ar_comp", '$'
START:
; Inicializar DS
MOV AX, @DATA
MOV DS, AX
; Desplegar mensaje
MOV DX, OFFSET MENSAJE
MOV AH, 09H
INT 21H
END
; Retorno al Sistema Operativo
MOV AX, 4C00H
INT 21H
END START
