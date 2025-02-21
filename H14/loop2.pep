br main

num:      .EQUATE 0
oddSum:   .EQUATE 2
evenSum:  .EQUATE 4 
oddmsg:   .ASCII "Even Sum: \x00"
evenmsg:  .ASCII "\nOdd Sum: \x00"

main: SUBSP 6,i; Allocate #evenSum #oddSum #num 
      LDA 0,i; Initialize oddSum to 0
      STA oddSum,s
      LDA 0,i; Initialize evenSum to 0
      STA evenSum,s

input: DECI num,s ;Read number
       LDA num,s  ;Load number on acc
       CPA 0,i    ;compare it with 0
       BREQ output;If num is zero, output
       ANDA 1,i   ;Check if odd
       CPA 0,i    ;compare to zero 
       BREQ even  ;not odd, go to even 

;This adds the odd numbers together 
odd: LDA oddSum,s ;Load oddSum 
     ADDA num,s   ;Add to oddSum
     STA oddSum,s ;Store new oddSum
     BR input     ;Continue loop until 0 

;This adds the even numbers together 
even: LDA evenSum,s ;Load evenSum
      ADDA num,s    ;Add to evenSum
      STA evenSum,s ;Store new evenSum
      BR input      ;Continue loop until 0

output: STRO oddmsg,d    
        DECO oddSum,s  ; Output odd sum
        STRO evenmsg,d   
        DECO evenSum,s ; Output even sum
        ADDSP 6,i      ; Deallocate #num #evenSum #oddSum  
stop             
.end