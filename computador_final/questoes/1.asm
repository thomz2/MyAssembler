 goto main 
 wb 0 

a ww 2086 #exemplo do ano bissexto
b ww 4 #valor pra dividir no teste
c ww 100 #valor pra dividir no teste
d ww 400 #valor pra dividir no teste
z ww 0 #valor auxiliar do 0
u ww 1 #valor auxiliar com 1

main add x, a 
     mod x, b
     ig x, z 
     jz x, finalruim # vai se n % 4 != 0
     sub x, u
     add x, a
     mod x, c # x = ano % 100
     ig x, z 
     jz x, finalbom
     sub x, u
     add x, a
     mod x, d
     jz x, finalbom
     ig x, z
     sub x, u
     jz x, finalruim

finalruim mov x, a
          goto final
 
finalbom add x, u
         mov x, a
         goto final

final halt
