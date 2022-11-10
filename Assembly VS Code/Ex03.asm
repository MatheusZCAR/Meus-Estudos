.MODEL SMALL                    ;repeticao de hello world (50 vezes) separada em blocos (utilizando o 09, que representa o \t)
.data
    msg db 'Ola, mundo :)',09,'$'
.CODE
    main proc
        mov ax,@data            ;inicializacao do ds
        mov ds,ax                
        mov ah,09h              ;funcao 09 da int 21 - escrever string
        mov dx, offset msg      ;string em msg
        mov cl, 50              ;numero de repetições
VOLTA:        
        int 21h
        dec cl
        jnz VOLTA
main endp
end main