Br main

num1: .equate 0 ;Local Variable #2d
msg: .ascii "Result: \x00"

ADD5:  Subsp 2,i     ;Allocate #num1
       DECI num1,s
       lda num1,s   
       ADDA   5,i
       STA    num1,s
       stro msg,d
       DECO   num1,s    ; Output the result
       addsp 2,i     ;deallocate #num1
       RET0           


;Main
main:  CALL ADD5
       
stop           
.end             