br main 

ch: .equate 1 ;variable #1c
c:  .equate 0 ;variable #1c

upper: CPA 97,i ;compare char to 'a'
       BRLT ques ;branch if char < 'a'
       CPA 122,i ;compare char to 'z'
       BRGT ques ;branch if char > 'z'
       SUBA 32,i ; lower to upper 
       STBYTEA ch,s ;store the char
       CHARO ch,s ;output the char 
       br endif

ques:  CHARO '?',i
       BR endif

endif: RET0

main:  SUBSP 1,i ;allocate #c 
       CHARi c,s
       LDBYTEA c,s
       STBYTEA -2,s
       SUBSP 1,i ;push #ch 
       CALL upper ;call method 
       ADDSP 1,i ;pop #ch 
       ADDSP 1,i ;deallocate #c 
stop
.end

        