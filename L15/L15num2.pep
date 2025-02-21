br main

char: .EQUATE 0 ;local Variable #1c
       
main:  subsp   1,i     ; allocate #char 
       LDA     0,i

input: CHARI   char,s    ; input next characters
       LDBYTEA char,s    ; Load input character 
       CPA     '.',i     ;'.'
       BREQ    end      ; '.' ends loop
       CPA    'a',i     ; convert to uppercase
       BRGE    upper    ; if char is lowercase, convert it to uppercase
       CHARO   char,s
       BR input 

lower: SUBA 32,i
       STBYTEA char,s
       CHARO char,s ;output Upper case CH
       br input ;branch to input

upper: CPA   'z',i
       BRLE  lower 
       CHARO char,s
       Br input ;bracnh to input


end:   ADDSP 1,i ;deallocate #char 
stop  
.end 