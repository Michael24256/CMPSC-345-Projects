BR main
num: .equate 0 
msg: .ascii " \x00"

main: SUBSP 2,i ;allocate #num

int_loop:DECI num, s ;input num
         LDA num,s ;put number into A
         BREQ endloop ;if zero, end loop
         CPA 0,i ;compare A with 0
         BRGE output ;if the number is positive or 0, output
         br int_loop ;continue input loop 

output:  DECO num, s ;output positive num
         STRO msg, d ;output a space between
         br int_loop ;continue int_loop

endloop: ADDSP 2,i ;deallocate #num

stop
.end