br main


num1: .EQUATE 2 ;local variable #2d
num2: .EQUATE 0 ;local variable #2d
msg1: .ASCII " - \x00"
msg2: .ASCII " = \x00"
n1: .equate 4 ;formal parameter #2d
n2: .equate 2 ;formal parameter #2d
ans: .equate 0; #2d

sub:     LDA n1, s    
         DECO n1,s ;display n1
         stro msg1, d ; '-'
         LDA n2, s 
         DECO n2,s     
         stro msg2, d ;'='
         LDA n1, s ;load n1
         suba n2, s ; sub n2 from n1
         subsp 2, i ; allocate #ans
         sta ans, s
         deco ans, s
         addsp 2, i;deallocate #ans
         charo '\n', i
         RET0



main:  LDA 2,i ;load 2
       STA -2,s ;store as num1
       LDA 5,i ;load 5
       STA -4,s ;store as num2
       subsp 4,i ; push #n1 #n2 
       CALL sub ;call sub
       addsp 4,i ;pop #n1 #n2
       subsp 4, i ;allocate #num1 #num2 
       deci num1,s ;declare num1
       deci num2,s ; declare num2

       lda num1,s
       sta -2,s
       lda num2, s
       sta -4, s
       subsp 4,i; push #n1 #n2
       CALL sub
       addsp 4,i ;pop #n1 #n2
       subsp 4, i ;allocate #num1 #num2 

stop
.end