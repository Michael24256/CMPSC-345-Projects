br main
num: .equate 0 
sum: .equate 2 
msg: .ascii "The sum is = \x00"

main: SUBSP 4,i ;allocate #sum #num
      LDA 0,i
      STA sum,s ;initialize sum to zero
      DECI num, s ;input num

while:      LDA num,s ;put number into A
            CPA 0,i ;compare A with 0
            
            BREQ endWhile ;if zero, end loop
            ADDA sum,s ;add sum
            STA sum,s ;store in sum
            LDA num,s ;Load in num
            SUBA 1,i  ;Subtract 1
            STA num,s ;store in num 
            br while  ;loop

endWhile: STRO msg, d ;output msg
          DECO sum,s ;output sum
          ADDSP 4,i ;deallocate #num #sum
stop
.end