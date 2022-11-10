.model small

.code
    main proc
    
    mov ah, 02      ;ativa a funcao
    mov dl, 97      ; move para o dl o codigo ascii da leta A (minuscula)
    

volta:
    int 21h         ;imprime a letra
    inc dl          ;incrementa o dl
    mov bl,dl       ;passa a informacao do dl para o bl
    
    mov dl, 32      ;registra a barra de espaco no dl
    int 21h         ;imprime a barra de espaco
    
    mov dl, bl      ;recupera a informacao de bl, passando para o dl
    int 21h         ;imprime a informacao
    
    inc dl          ;incrementa o dl
    mov bl, dl      ;guarda a informacao em bl
    
    mov dl, 10      ;registra o enter no dl
    int 21h         ;imprime o enter
    
    mov dl,bl       ;recupera a informacao
    cmp dl, 121     ;observa se o dl ? 121
    jle volta       ;se o dl eh menor que 121, volta e repete o loop
    mov ah,4ch      ;sai do programa
    int 21h
    
main endp 
end main