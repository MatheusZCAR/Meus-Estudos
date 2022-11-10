.model small
.data 

 matrix dw 4 dup(?)
        dw 4 dup(?)
        dw 4 dup(?)
        dw 4 dup(?)

 matrix2 dw 4 dup(?)
         dw 4 dup(?)
         dw 4 dup(?)
         dw 4 dup(?)

msg db "Enter the elements of the matrix", 10, 13, '$'
msg1 db "The matrix is", 10, 13, '$'
msg2 db "The transpose of the matrix is", 10, 13, '$'

.code
main proc 
     
     mov ax,@data ; set data segment
        mov ds,ax

        call lematrix ;call the function to read the matrix

        call printamatrix ;call the function to print the matrix

        call invertematrix ;call the function to invert the matrix

    mov ah,4ch ; terminate program
        int 21h

main endp

lematrix proc

    mov dx,offset msg
    mov ah,09h
    int 21h

    xor si,si; set si to 0

    mov ch,4; set ch to 4 for the loop
    mov cl,4; set cl to 4 for the loop

linha:
coluna:

    mov ah,01h; set the read function
    int 21h; call the function

    and ax,0ffh; clear the ah register

    sub ax,30h; substract 30h to the turn the caracter into a number

    mov matrix[si],ax; store the number in the matrix

    add si,2; add 2 to si to go to the next position

    dec ch
    jnz coluna

    ;broken line
    mov ah,02h; set the write function
    mov dl,10; set the caracter to be printed
    int 21h; call the function

     mov ch,4; set ch to 4 for the loop because we lost the value

    dec cl
    jnz linha

ret

lematrix endp

printamatrix proc 

    mov dx,offset msg1
    mov ah,09h
    int 21h

   mov ch,4; set ch to 4 for the loop
    mov cl,4; set cl to 4 for the loop

    xor si,si; set si to 0
    xor bx,bx; set bx to 0

linha2:
coluna2:

    mov ax,matrix[si]; get the number from the matrix

    add ax,30h; add 30h to the turn the number into a caracter

    mov ah,02h; set the write function
    mov dl,al; set the caracter to be printed
    int 21h; call the function

    add si,2; add 2 to si to go to the next position

    dec ch
    jnz coluna2

    ;broken line
    mov ah,02h; set the write function
    mov dl,10; set the caracter to be printed
    int 21h; call the function

     mov ch,4; set ch to 4 for the loop because we lost the value

    dec cl
    jnz linha2

 ret     
printamatrix endp

invertematrix proc

    mov dx,offset msg2
    mov ah,09h
    int 21h

    xor si,si; set si to 0
    xor bx,bx; set bx to 0

    mov ch,4; set ch to 4 for the loop
    mov cl,4; set cl to 4 for the loop
    mov bx,-2
    mov di,-8
    
linha3:
coluna3:

    add bx,2 ; add 2 to bx to go to the next position
    add di,8 ; add 8 to di to go to the next position

    mov dx,matrix[bx]; get the number from the matrix
    mov matrix2[di],dx; store the number in the  second matrix

    dec ch
    jnz coluna3

    sub di,30 ; sub 30 to di to go to the next line
    mov ch,4; set ch to 4 for the loop because we lost the value

    dec cl
    jnz linha3

    ;moving the matrix2 to the first matrix

    mov ch,4; set ch to 4 for the loop
    mov cl,4; set cl to 4 for the loop

    xor si,si; set si to 0
    xor bx,bx; set bx to 0

linha4:
coluna4:

    mov dx,matrix2[bx][si]; get the number from the matrix
    mov matrix[bx][si],dx; store the number in the first matrix again

    add si,2; add 2 to si to go to the next position

    dec ch
    jnz coluna4

    xor si,si; set si to 0

    add bx,8; add 8 to bx to go to the next line
    mov ch,4; set ch to 4 for the loop because we lost the value

    dec cl
    jnz linha4

ret 
invertematrix endp

end main