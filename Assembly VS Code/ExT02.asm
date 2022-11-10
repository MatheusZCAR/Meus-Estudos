.model small
.data
.code
    
    main proc
        volta:
        mov ah,01
        int 21h
        mov ah,02
        mov dl,al
        int 21h
        cmp al,"*"
        jnz volta

    fim: 
        mov ah,4ch
        int 21h
