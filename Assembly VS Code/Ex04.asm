.MODEL SMALL
.DATA
    STRI db 10, '$$$$$$$$$$$$$'
.CODE
    main proc
    
    mov ax,@DATA            ;inicializacao de DS
    mov ds, ax              ;destino <---- origem
    mov ah, 0Ah             ;funcao 0Ah funciona como um scanf para str
    mov dx, offset STRI
    int 21h
    mov ah, 02              ;funcao 02 imprime 
    mov dl, 10
    int 21h
    mov ah, 09              ;funcao para escrever string
    mov dx, offset STRI     ;endereco inicial da str
    add dx, 02
    int 21h
    mov ah, 4Ch             ;exit
    int 21h
   
   main endp
  end main