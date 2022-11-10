.MODEL SMALL
.CODE

main proc
    CALL entrada                ;chama procedimento de entrada
    CALL saida                  ;chama procedimento de saida
    MOV ah,4ch                  ;finaliza o programa
    INT 21h
main endp

;procedimento de entrada

entrada proc
    XOR bx,bx                   ;limpa bx
    MOV cl,4                    ;contador (4 espacos)
    MOV ah,01h                  ;guarda a funcao de leitura
    INT 21h                     ;executa

TOPO:
    CMP al,0dh                  ;compara al com enter
    JE FIM                      ;se for enter, pula para o fim
    CMP al,39h                  ;compara al para descobrir se eh numero ou letra (por ser hexadecimal, pode ser letra)
    JG LETRA                    ;se for letra, pula para "LETRA"
    AND al,0fh                  ;remove 30h se for numero 
    JMP DESL                    ;pula para "DESL"

LETRA:
    SUB al,37h                  ;transforma letra em binario

DESL:
    SHL bx,cl                   ;move bx 4 casas para a esquerda
    OR bl,al                    ;insere valor nos 3 bits de bx (0 a 3)
    INT 21h                     ;executa
    JMP TOPO                    ;realiza jump até que haja o enter

FIM:
    RET
entrada endp

saida proc                      ;procedimento de saida
    MOV ch,4                    ;contador de caracteres em hexadecimal
    MOV cl,4                    ;conta os deslocamentos
    MOV ah,02h                  ;funcao de imprimir

TOPOI:  
    MOV dl,bh                   ;pega os 8 bits mais significativo de BX
    SHR dl,cl                   ;coloca em dl outros 4 bits  mais significativos de BX

    CMP dl,0ah                  ;compara e testa se o que foi recebido eh numero ou letra
    JAE LETRAI                  ;se for letra, pula para letraI

    ADD dl,30h                  ;caso contrario, soma 30h (digitos)
    JMP PTI

LETRAI:
    ADD dl,37h                  ;soma 37h (tabela ascii)

PTI:
    INT 21h                     ;executa e exibe o resultado na tela
    ROL bx,cl                   ;roda bx 4 casas para a direita
    DEC ch                      
    JNZ TOPOI                   ;faz a repeticao 4 vezes
    RET                         ;return
saida endp

end main