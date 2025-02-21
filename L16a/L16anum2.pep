Br main

num1: .equate 0 ;Local Variable #2d
return: .equate 4 ;Local Variable #2d
msg: .ascii "Result: \x00"

ADD5:  Subsp 2,i        ;Allocate #num1 
       DECI num1,s
       lda num1,s   
       ADDA   5,i
       STA    return,s
       stro msg,d
       DECO   num1,s    ;Output the input
       Charo ' ',i
       addsp 2,i        ;deallocate #num1 
       RET0            


;Main 
main:  Subsp 2,i ;allocate #return
       CALL ADD5
       Deco 0,s  ;output result
       Addsp 2,i ;allocate #return 
stop            
.end