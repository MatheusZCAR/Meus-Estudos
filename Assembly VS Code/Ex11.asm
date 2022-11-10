.MODEL SMALL
.data
    msg db 'Digite dois numeros de 0 a 9 e descubra o maior',10,'$'

.CODE
    main proc
        mov ax,@data
        mov ds,ax
        mov ah,09h
        lea dx,msg
        int 21h
        
        mov ah,01h
        int 21h
        mov bl,al

        mov ah,01h
        int 21h
        mov bh,al

        cmp bl,bh
        ja MAIOR
        mov ah,02h
        int 21h


MAIOR:
        mov bh,bl
        mov ah,02h
        int 21h

        mov ah,4ch
        int 21h
    

main endp
end main