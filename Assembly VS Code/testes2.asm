.model SMALL
.data
.CODE

main proc

    mov cx,0
    volta:
    mov ah,01
    int 21h
    inc cx
    and dl,0fh
    cmp cx,8
    jnz volta
    mov ah,02
    int 21h
    
mov ah,4ch
main endp
end main