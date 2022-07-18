 goto main
 wb 0

x1 ww 13
x2 ww 34
x3 ww 29

main add x, x1
     min x, x2
     min x, x3
     mov x, x1
     goto final

final halt