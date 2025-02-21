BR main

num: .EQUATE 0
msg: .ASCII "Positive integers: \x00"

main: SUBSP 2,i ;allocate #num



inp_loop: Deci num,s 
LDA num,s
BREQ prt_num 
CPA 0,i
BRGE prt_num
Br inp_loop



prt_num: DECO num,s
STRO msg,d
BR inp_loop 

stop: ADDSP 2,i ;Deallocate #num
stop
.end