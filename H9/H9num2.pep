BR main

score1: .block 2 ;global variable #2d
score2: .block 2 ;global variable #2d
average: .block 2 ;global variable #2d
bonus: .EQUATE 7

Space: .ascii "\n\x00"   ; Print "\n\x00"

output1: .ascii "First test score is \x00"    ;  "First test score is \x00"
output2: .ascii "Second test score is \x00"   ;  "Second test score is \x00"
output3: .ascii "Boosted average is \x00"     ;  "Boosted average is \x00"

main:  deci score1, d           ; Input the first score
       deci score2, d           ; Input the second score
       lda score1, d            ; Load the first 
       adda score2, d           ; Add the second 
       asra                     ; Shift right 
       adda bonus, i            ; Add bonus
       sta average, d           ; Store  average
       stro output1, d          ; "First test score is \x00"
       deco score1, d           ; Output the first test score
       STRO Space, d            ; "\n\x00"

       stro output2, d          ; "Second test score is \x00"
       deco score2, d           ; Output the second test score
       STRO Space, d            ; "\n\x00"

       stro output3, d          ; "Boosted average is \x00"
       deco average, d          ; Output the boosted average
       stop                     ; End 
       .end