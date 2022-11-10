.MODEL SMALL    ;ex 01 aula 2

.CODE
    main proc
    
    mov ah, 01          ;leitura do caractere
    int 21h             ;retorna codigo ASCII ao registrador AL
    
    mov bl,al           ;move o codigo ASCII para o BL (destino <---- origem)
    mov dl, bl          ;move para DL
    
    mov ah, 02        ;funcao 2 que escreve o caractere 
    int 21h           ;imprime o caractere armazenado em DL          
        
main endp
end main
