Br main

;printStars
a: .equate 4 ; Local Variable #2d
b: .equate 0 ; Local Variable #2d

;printRange
c: .equate 0 ; Local Variable #2d
d: .equate 2 ; Local Variable #2d

;inRange
e: .equate 4 ; Local Variable #2d
f: .equate 2 ; Local Variable #2d
g: .equate 0 ; Local Variable #2d

msg:   .ASCII "in range\n\x00"
msg2:  .ASCII "outside range\n\x00"

; Print stars 
prStar:     SUBSP 2, i ;Allocate #b 
            LDA a,s    ;Input num in a
            STA b,s
            LDA 0,i    ;count = 0

start:      CPA b,s     ;Compare b with a
            BRGE finish ;count >= a, end
            CHARO '*', i
            CHARO '\n', i ;Creates a new line
            ADDA 1, i   ;count++
            BR start    ;Repeat 

finish:     ADDSP 2, i    ;Deallocate #b 
            RET0          ;Return 

; c and d, print range
prRange:    SUBSP 4, i ;Allocate #d #c 
            LDA 6,s    ;load 6
            STA c,s    ;store 6 in c
            LDA 8,s    ;Load 8 
            STA d,s    ;store 8 in d
     
start2:     CPA c,s      ;Compare c with d
            BRGT finish2 ;c > d, end loop
            STA d,s
            DECO d, s    ;print c
            CHARO ' ', i 
            ADDA 1, i    ;c++ 
            BR start2    ;Repeat 

finish2:    CHARO '\n', i 
            ADDSP 4, i   ;deallocate #c #d 
            RET0         ;return 

;inrange
inRange:    SUBSP 6,i  ;Allocate #g #f #e
            LDA  12,s  ;Load 12 
            STA e,s    ;Input 12 into e
            LDA  10,s  ;Load 10 
            STA f,s    ;Input 10 into  f
            LDA 8,s    ;Load 8 
            STA 0,s    ;Input 8 into  g 
            CPA e,s    ;Compare g and e
            BRLT outRange ;if g < range bounf, go to outsiderange
            CPA f,s       ;Compare'g with f
            BRGT outRange ;If g > upper range bound, go to outsideRange
            STRO msg, d   ;Output msg
            BR endCheck
 
outRange:     STRO msg2, d ; Output msg2
endCheck:     ADDSP 6, i ; Deallocate #e #f #g
              RET0 ; Return 



x: .EQUATE 0 ; Local Variable #2d
y: .EQUATE 0 ; Local Variable #2d
z: .EQUATE 0 ; Local Variable #2d

main: SUBSP 2,i  ;allocate #x 
      DECI x,s   ;Input x 
      LDA x,s    ;load x 
      STA -2,s   ;Store x 
      subsp 2,i  ;push #b 
      CALL prStar
      addsp 2,i  ;pop #b 
      subsp 2,i  ;allocate #y
      DECI y,s   ;Input y 
      LDA y,s    ;load y 
      STA -4,s   ;Store y 
      LDA 2,s
      STA -2,s
      subsp 4,i ;push #d #c
      CALL prRange
      addsp 4,i ;pop #c #d

      subsp 2,i ;allocate #z
      DECI z,s  ;Input z 
      LDA z,s   ;load z
      STA -6,s  ;Store z 
      LDA 2,s   ;load y back into acc
      STA -4,s  ;store y to stack
      LDA 4,s   ;load x back into acc
      STA -2,s  ;store x to stak
      subsp 6,i ;push #g #f #e
      CALL inRange ;call subroutine for check range 
      addsp 6,i ;pop #e #f #g
      ADDSP 6,i ;deallocate #x #y #z

stop
.end