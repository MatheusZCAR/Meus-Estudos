.MODEL SMALL
.CODE

main proc
    CALL entrada            ;chama procedimento entrada
    CALL saida              ;chama procedimento saida
    MOV ah,4ch              ;finaliza o programa
    INT 21h
main endp

;procedimento entrada

entrada proc
    MOV cx,16               ;contador de digitos (ate 16 espacos)
    MOV ah,01h              ;guarda em ah a funcao de leitura
    XOR bx,bx               ;limpa bx
    INT 21h                 ;executa

TOPO: 
    CMP al,0dh              ;compara se Al eh enter, caso sim pula para o final
    JE FIM                  ;se for enter, pula para o fim
    AND al,0fh              ;caso contrario, remove 30h (transforma em digito)

    SHL bx,01               ;libera um novo espaco para digito 
    OR bl,al                ;insere o LSB (digito menos significativo) de bl
    INT 21h                 ;executa
    LOOP TOPO               ;realiza o loop ate 16 (dado em cx)
FIM:
    RET                     ;return
entrada endp

;procedimento saida

saida proc
    MOV cx,16               ;contador de digitos (16 espacos)
    MOV ah,02h              ;funcao de imprimir
    
PT1:
    ROL bx,01               ;faz uma casa de bx para a esquerda
    JNC PT2                 ;realiza o salto se carry = 0 (nao tem "vai um")

    MOV dl,31h              ;nesse caso, CF = 1
    INT 21h                 ;executa e exibe na tela o num 1 (31h em hexa)
    JMP PT3                 ;pula para PT3

PT2:
    MOV dl,30h              ;nesse caso, CF = 0
    INT 21h                 ;executa e exibe na tela o num 0 (30h em hexa)

PT3: 
    LOOP PT1                ;realiza a repeticao (16 vezes, conforme dado no cx)
    RET
saida endp

end main



