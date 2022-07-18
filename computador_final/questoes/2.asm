 goto main
 wb 0

total ww 100
a ww 0 # valor booleano que diz se eh primo ou não
r ww 0 # numero que vai checar se eh primo
resto ww 0
i ww 0
um ww 1
dois ww 2
iq ww 0

contador ww 0

main add x, total
     bigr x, dois # total <= dois => 0
     jz x, menorigualquedois
     sub x, um 
     goto enesimo


1test add x, r 
      ig x, dois
      jz x, test 
      mov x, a
      goto veredito 

test add x, r # x vem zerado 
     smlr x, dois 
     jz x, resetlaco
     sub x, um
     mov x, a
     goto veredito

resetlaco mov x, i
          mov x, iq
          add x, um
          goto inc

podeserprimo add x, i
             mov x, i 
             mult x, i
             mov x, iq # salva o valor i*i atual em iq
             sub x, iq # zera x
             add x, r # x = N
             mod x, i # resto de N por i
             mov x, resto
             jz x, naoprimo # resto zero
             sub x, resto # zerei x
             add x, iq
             bigr x, r
             jz x, inc # ABAIXO EH QUANDO ACABA O LACO E acha o primo
             mov x, a
             goto veredito

inc add x, um
    goto podeserprimo 

naoprimo mov x, a 
         goto veredito       

veredito jz x, enesimo
         add x, contador
         mov x, contador
         ig x, total
         jz x, separacaminho
         
         sub x, um 
         add x, r
         mov x, total
         halt

separacaminho add x, total
              bigr x, dois # x!= total => x = 0
              jz x, menorigualquedois
              goto escolheenesimo

menorigualquedois add x, total # tem que ver se o total == 1 ou 2
                  add x, um
                  mov x, total  
                  halt

escolheenesimo sub x, um # ve se adiciona um ou dois ; x vem igual 1
               add x, a # x = 0 => nao eh primo => pula 1
               jz x, enesimo
               goto enesimo

enesimo add x, r # depois da main, tem que vir pra ca zerado
        add x, um
        mov x, r
        goto 1test
