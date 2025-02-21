BR main
guess: .EQUATE 0 ; local variable #2d
seven: .EQUATE 2 ; local variable #2d
guesscnt: .EQUATE 4 ; local variable #2d

guessnum: .ASCII "Guess a Number Between 1 and 10, you have 5 guesses! \n\x00"
msgright: .ASCII "Congratulations!\n\x00"
msgwrong: .ASCII "Incorrect, the number was: \x00"

main: SUBSP 6, i ;allocate #guess #seven #guesscnt 
      LDX 0,i
      LDA 7,i
      STA seven,s
      STRO guessnum,d

for:  DECI guess, s ;guesses
      LDA guess, s ;Load number to guess

      CPA seven, s ; Compare x to 0 guess with number
      BREQ correct ; If 7, go to msgright
      ADDX 1, i ; Increment guesses left
      CPX 5,i  ;Compare with 5
      BRLT for 
      BR done ; If not guessed, go to msgwrong

correct:  STRO msgright, d ; Output congats message
          ADDSP 6, i ; Deallocate #guess #seven #guesscnt 
          stop

done:     STRO msgwrong, d ; output wring msg
           DECO seven,s ; Output 7, which is the correct number
           ADDSP 6, i ; Deallocate #guess #seven #guesscnt 
stop
.end