.MODEL SMALL
.CODE
    main proc
    mov ah,1     ;funcao que faz leitura de caracteres
    int 21h      ;imprime
    sub al, 30h  ;transforma em um leitor de digitos, nao de caracteres
    mov bl,al    ;move o valor para dl

    mov ah,02
    mov dl, 43
    int 21h

    mov ah,1     ;funcao que faz leitura de caracteres
    int 21h      ;imprime
    sub al, 30h  ;transforma em um leitor de digitos, nao de caracteres
    add bl,al    ;move o valor para dl

    mov ah,2
    mov dl, 61
    int 21h

    mov ah,02
    mov dl,bl
    add dl,30h
    int 21h
    
    
    mov ah, 4ch  ;finaliza o codigo
    int 21h
main endp
end main