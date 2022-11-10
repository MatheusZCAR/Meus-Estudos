.MODEL SMALL
.STACK 0100h
.DATA 
msg1 DB '?', 10,'$'
.CODE
    main proc
    MOV ax,@data
    MOV ds,ax

    MOV ah,09h
    LEA dx,msg1
    INT 21h

    XOR cx,cx
    MOV ah,01
    
    LGR:
    INT 21h
    CMP al,13
    JE IMPRIME
    
    PUSH ax
    INC cx
    JMP LGR
    
    IMPRIME: 
    JCXZ FIM

    IMP2:
    MOV ah,02h
    POP dx
    INT 21h
    LOOP IMP2
    
    FIM: 
    MOV ah,4ch
    int 21h

    main endp
    end main