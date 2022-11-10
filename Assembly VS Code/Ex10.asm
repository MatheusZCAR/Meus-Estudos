.model SMALL
.data 

.CODE
    main proc
      ;CONTA A)
      mov al,6  ;armazena o valor 6 no registrador al
      sub al,4  ;subtrai o valor de al (6) com o numero 4
    
      ;CONTA B)
      mov al,7  ;armazena o valor de 7 no registrador al
      add al,2  ;faz a soma de al (7) com o numero 2

      ;CONTA C)
      mov al,6  ;armazena o valor de 6 no registrador al
      neg al    ;transforma o valor em al (6) em negativo (-6)

      mov bl,6  ;armazena o valor de 6 no registrador bl
      neg bl    ;transforma o valor em bl (6) em negativo (-6)

      add al,bl ;faz a soma entre al e bl ((-6) + (-6))

      ;CONTA D)
      mov al,8  ;armazena o valor de 8 no registrador al
      neg al    ;transforma o valor em al (8) em negativo (-8)

      mov bl,3  ;armazena o valor de 3 no registrador bl
      neg bl    ;transforma o valor em bl (3) em negativo (-3)

      sub al,bl ;faz a subtracao entre al e bl ((-8) - (-3))

    mov ah,4ch  ;finaliza o programa
    int 21h

main endp
end main