BR main

char1: .equate 2 ;formal parameter #1c

ch1: .EQUATE 0 ; Local variable #1c
ch2: .EQUATE 1 ; Local variable #1c
ch3: .EQUATE 2 ; Local variable #1c
ch4: .EQUATE 3 ; Local variable #1c
ch5: .EQUATE 4 ; Local variable #1c

output1: .ASCII "The first character: \x00"
output2: .ASCII "The second character: \x00"
output3: .ASCII "The third character: \x00"
output4: .ASCII "The fourth character: \x00"
output5: .ASCII "The fifth character: \x00"



upper: LDBYTEA char1,s  ;loads first char into memory
       CHARO char1,s
       CHARO ' ',i 
       SUBA 32,i     ; ch1 to upper
       STBYTEA char1,s  ; store upper in memoty
       CHARO char1,s    ;output uppercase 
       CHARO '\n',i
       RET0

main: SUBSP 5,i ;allocate #ch5 #ch4 #ch3 #ch2 #ch1
      CHARI ch1,s    ;Input first lowercase character
      CHARI ch2,s    ;Input second lowercase character
      CHARI ch3,s    ;third
      CHARI ch4,s    ;fourth
      CHARI ch5,s    ;fifth

      LDBYTEA ch1,s ;load input for ch1
      stro output1,d
      STBYTEA -1,s
      subsp 1,i ;push #ch1 
      call upper
      addsp 1,i ;pop #ch1
      
      LDBYTEA ch2,s ;load input for ch2
      stro output2,d
      STBYTEA -1,s
      subsp 1,i ;push #ch1 
      call upper
      addsp 1,i ;pop #ch1

      LDBYTEA ch3,s ;load input for ch3
      stro output3,d
      STBYTEA -1,s
      subsp 1,i ;push #ch1 
      call upper
      addsp 1,i ;pop #ch1 

      LDBYTEA ch4,s ;load input for ch4
      stro output4,d 
      STBYTEA -1,s
      subsp 1,i ;push #ch1 
      call upper
      addsp 1,i ;pop #ch1
      
      LDBYTEA ch5,s ;load input for ch5
      stro output5,d
      STBYTEA -1,s
      subsp 1,i ;push #ch1 
      call upper
      addsp 1,i ;pop #ch1

      ADDSP 5,i ;deallocate #ch1 #ch5 #ch4 #ch3 #ch2
stop
.end