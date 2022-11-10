.MODEL SMALL
.CODE
    main proc
    mov dl, '*'     ;define o que imprimir
    mov bh, 10      ;contador para imprimir quantos '*' por linha
    mov cx, 50      ;contador do total de '*' que serão impressos, sera utilizado com o loop
for:                ;inicio da repeticao
    mov ah, 02      ;funcao de impressao 
    int 21h         ;executa o comando acima
    dec bh          ;decresce bh
    jnz SALTA       ;salta se bh chegar a 0
    mov ah, 01      ;verifica se o enter foi pressionado
    int 21h         ;executa o comando acima
    mov bh, 10      ;fornece mais 10 espacos para bh imprimir os '*' novamente
SALTA:
    loop for        ;loop que substitui o bl e o jnz
    mov ah, 4ch     ;finaliza o programa
    int 21h         ;executa o comando acima
    main endp       ;final do programa
    end main        ;final do programa