 goto main 
 wb 0

n ww 900
c ww 0
d ww 1073741824
d1 ww 0
cmaisd ww 0
comparador ww 0
um ww 1
zero ww 0
r ww 0
const ww 81

main add x, n
     bigr x, const
     jz x, alve
     sub x, um  
     goto thom

thom add x, d 
     goto compara
           
compara bigr x, n # ve se d > n
        jz x, dmenorigual # sai do loop
        sub x, um # zera o x novamente
        add x, d # pega o valor de d 
        desl2 x
        mov x, d # desloca duas vezes pra direita o valor de d
        goto compara

dmenorigual sub x, um
            add x, d
            goto segundow # erro depois daqui

segundow ig x, zero # ve se d é igual a 0, se for sai do loop
         jz x, loop # se for diferente de 0, continua o loop
         sub x, um
         add x, c 
         mov x, n
         halt 

loop add x, c # Aqui, x começa como 0
     add x, d 
     mov x, cmaisd 
     sub x, cmaisd
     add x, n
     smlr x, cmaisd # n < c+d 
     jz x, iff # entra no if se n >= c + d
     sub x, um # aqui começa o ELSE 
     add x, c
     desl1 x
     mov x, c # c = c >> 1
     sub x, c # zera x
     goto ultimasloop  

iff add x, n # x = 0 ao entrar aqui
    sub x, cmaisd
    mov x, n # n -= c + d
    sub x, n # zera x
    add x, c 
    desl1 x
    add x, d
    mov x, c # c = (c >> 1) + d
    sub x, c # zera x
    goto ultimasloop 

ultimasloop add x, d
            desl2 x
            mov x, d # d = d >> 2
            goto segundow # x vai pra la sendo o d atualizado    
            
alve add x, um 
     mov x, c 
     mult x, c 
     mov x, d1 
     ig x, n 
     ig x, r 
     jz x, finaligual 
     sub x, um 
     add x, d1 
     bigr x, n 
     ig x, r 
     jz x, finalmaior 
     sub x, um 
     jz x, finalmenor 


finalmenor add x, c 
           goto alve #voltamos ao main pra recomeçar o processo

finaligual add x, c 
           mov x, n #a recebe o c 
           goto final

finalmaior add x, c 
           sub x, um 
           mov x, n 
           goto final

final halt     