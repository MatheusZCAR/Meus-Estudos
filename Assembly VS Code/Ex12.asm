;CALL chama procedimento
;RET  retorna procedimento sem parametros
.MODEL SMALL
.STACK 0100h
.CODE
    main proc
    XOR cx,cx
    CALL LER
    JCXZ FIM       ;se cx = 0, pula e termina
    CALL IMPRIME

    FIM:
    MOV ah,4ch
    INT 21h
    main endp

    LER proc

    MOV ah,01
    INI_LER:
    INT 21h
    CMP al,13
    JE FIM_LER
    PUSH ax 
    INC cx
    JMP INI_LER

    FIM_LER:
    RET
    LER endp

    IMPRIME proc
    
    INI_iMP:
    MOV ah,02
    POP dx
    INT 21h
    LOOP INI_IMP
    RET
    IMPRIME endp
    end main