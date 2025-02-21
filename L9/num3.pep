         BR  main

LOWER: .EQUATE 0x20  
char1: .BLOCK 2  ;global variable #2d
char2: .BLOCK 2  ;global variable #2d
char3: .BLOCK 2  ;global variable #2d

main: CHARI char1, d    ; Input first lowercase char
           LDBYTEA char1, d  ; Load first lowercase char in memory
           SUBA LOWER, i    ; uppercase conversion   
           STBYTEA char1, d  ; Store first uppercase char in memory
           CHARO char1, d    ; Output first uppercase

      CHARI char2, d    ; Input second lowercase char
           LDBYTEA char2, d  ; Load second lowercase char in memory
           SUBA LOWER, i    ;  uppercase conversion 
           STBYTEA char2, d  ; Store second uppercase char in memory
           CHARO char2, d    ; Output second uppercase 

      CHARI char3, d    ; Input third lowercase char
           LDBYTEA char3, d  ; Load third lowercase char in memory
           SUBA LOWER, i    ; uppercase conversion   
           STBYTEA char3, d  ; Store third uppercase char in memory
           CHARO char3, d    ; Output third uppercase char
      STOP              ; Stop 
     .END