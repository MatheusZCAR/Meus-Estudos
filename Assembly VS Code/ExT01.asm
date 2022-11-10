.model small
.data
.code

main proc
    volta:
        mov ah,01
        int 21h
        cmp al,"*"
        jz fim
        mov ah,02
        mov dl,al
        int 21h
        jmp volta

    fim: 
        mov ah,4ch
        int 21h

main endp
end main
