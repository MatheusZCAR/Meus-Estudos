.MODEL SMALL  ;imprime um sinal de mais e igual
.CODE
MAIN PROC
    mov ah,2
    mov dl,43
    int 21h
    
    mov dl,61
    int 21h

    mov ah,4ch
    int 21h
    main endp
    end main