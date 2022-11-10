.MODEL SMALL
.DATA
var1 DB ?

MATRIZ DW 0,0,0,0
       DW 0,0,0,0
       DW 0,0,0,0
       DW 0,0,0,0

.CODE
    main proc
        MOV ax,@DATA
        MOV ds,ax

        CALL input

        MOV ah,4ch
        INT 21h
        main endp
   
    input proc
        XOR ax,ax
        XOR dx,dx

        MOV ah,01h
        INT 21h
        
        MOV bl,al
        SUB bl,30h
        MOV var1,bl
        
        RET
    input endp

    end main