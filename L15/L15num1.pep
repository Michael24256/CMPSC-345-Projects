br main

count:  .EQUATE 0    ; Local variable #2d
num:    .EQUATE 2    ; Local variable #1c 

outputth: .ASCII "There are \x00"
outputse: .ASCII " sevens\x00" 

main: subsp 3,i  ; Allocate #num #count
      LDX 0,i     ;mak ethe counter 0
      

input:   CHARI num,s  ;number input
         LDA 0,i
         LDBYTEA num,s   ;Load number to num
         CPA '#',i   ;Check to see if input ends in '#'
         BREQ end    ;If so, exit loop
         CPA  '7',i   ;Check if 7
         BRNE input  ;if not 7, continue
         ADDX 1,i   
         BR input    ; Continue input

end:  STX  count,s  ;store count
      STRO outputth,d 
      DECO count,s  ;Output  result
      STRO outputse,d  
      addsp 3,i   ; Deallocate #count #num
stop
.end      