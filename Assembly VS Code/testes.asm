.model SMALL
.data
.CODE

main proc

    MOV ah,01             ;pega primeiro numero
    INT 21h
    SUB al,30h            ;transforma em digito
    MOV bl,al             ;move para bl

    MOV ah,01             ;pega segundo numero
    INT 21h                   
    SUB al,30h            ;transforma em digito

    SUB bl,al
    MOV ah,02

    JNS pula

    MOV dl,'-'
    INT 21h
    NEG bl   

    pula:
    ADD bl,30h
    MOV dl,bl
    INT 21h

MOV ah,4ch
main endp
end main