TITLE NOME: MATHEUS ZANON CARITÁ   RA: 22014203 

.MODEL SMALL
.data

msg1 db 'Entre com o primeiro numero: ','$'
msg2 db 10,'Entre com o segundo numero: ','$'
msg3 db 10,10,'Maior numero: ','$'
msg4 db 10,10,'Menor numero: ','$'
msg5 db 10,'Paridade: par','$'
msg6 db 10,'Paridade: impar','$'

.CODE
    main proc
        mov ax,@data            ;inicia o data
        mov ds,ax  
                
        mov ah,09h              ;funcao que imprime string
        lea dx,msg1             ;frase 1
        int 21h                 ;executa e imprime frase 1 (entre num 1)

        mov ah,01h              ;funcao para pegar o primeiro numero
        int 21h                 ;executa          
        mov bh,al               ;move o conteudo de al para bh

        mov ah,09h              ;funcao que imprime string
        lea dx,msg2             ;frase 2
        int 21h                 ;executa e imprime frase 2 (entre num 2)

        mov ah,01h              ;funcao para pegar o segundo numero
        int 21h                 ;executa          
        mov bl,al               ;move o conteudo de al para bl

        cmp bh,bl               ;compara bh e bl
        jnle maiorigual         ;jump, se o digito em bh for maior ou igual
        xchg bh,bl              ;se o bh for menor que bl, ha uma troca entre eles
    
    maiorigual:
        mov ah,09h              ;funcao que imprime string
        lea dx,msg3             ;frase 3
        int 21h                 ;executa e imprime frase 3 (maior num:)

        mov dl,bh               ;passa informacao para dl, para imprimir
        mov ah,02h              ;funcao de imprimir
        int 21h                 ;imprime maior numero, que estava em bh apos a troca

        add bh,0                ;altera o flag

        jnp impar               ;jump se paridade for impar
        mov ah,09h              ;funcao que imprime string
        lea dx,msg5             ;frase 5
        int 21h                 ;executa e imprime frase 5 (paridade par)
         
        jp par                  ;jump paridade par

    impar:
        mov ah,09h              ;imprime string
        lea dx,msg6             ;frase 6
        int 21h                 ;executa e imprime frase 6 (paridade impar)

    par:
        mov ah,09h             ;funcao de imprimir string
        lea dx,msg4            ;frase 4
        int 21h                ;executa e imprime frase 4 (menor num:)

        mov dl,bl              ;transfere conteudo de bl para dl
        mov ah,02h             ;funcao de imprimir
        int 21h                ;executa e imprime numero de bl

        add bl,0               ;alterar flag

        jnp imparII            ;jump se paridade for impar
        mov ah,09h             ;funcao de imprimir string
        lea dx,msg5            ;frase 5
        int 21h                ;executa e imprime frase 5 (paridade par)
    
        jp parII               ;jump se paridade par (final)

    imparII:                  
        mov ah,09h             ;funcao imprime string
        lea dx,msg6            ;frase 6
        int 21h                ;executa e imprime frase 6 (paridade impar)

    parII:
        mov ah,4ch             ;final do programa
        int 21h

    main endp
    end main
