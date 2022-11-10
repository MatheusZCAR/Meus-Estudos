.MODEL SMALL          ;hello world sem repeticao
;mov eh utilizado para mover valores na memoria
.data
    msg db 'Ola, mundo :)',10,'$'
.CODE
    main proc
        mov ax,@data       ;inicializacao do ds
        mov ds,ax		  
        mov ah,09h	   ;funcao 09 da int 21 - escreve a string	
        lea dx,msg	   
        int 21h
        mov ah,4ch
        int 21h
main endp
end main
