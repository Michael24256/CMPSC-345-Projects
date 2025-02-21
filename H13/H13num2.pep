BR main
x: .EQUATE 0  ; Offset for local variable x
y: .EQUATE 2  ; Offset for local variable y

Msg1: .ASCII "The largest of \x00"  ; Message: "The largest of "
Msg2: .ASCII " and \x00"              ; Message: " and "
Msg3: .ASCII " is \x00"               ; Message: " is "

main: SUBSP 4,i ; Allocate space for #y and #x
      DECI x,s ; Input x 
      DECI y,s ; Input y

if:   LDA x,s ; Load x
      CPA y,s ; Compare x with y
      BRGE else ; If x is >=, branch to else
      LDA y,s ; Load y into the accumulator
      BR endif ; Skip to endif

else: LDA x,s ; Load x 
      STRO Msg1,d ; Output the message "The largest of "
      DECO x,s ; Output x
      STRO Msg2,d ; Output the message " and "
      DECO y,s ; Output y
      STRO Msg3,d ; Output the message " is "
      DECO x,s ; Output x
      BR end ; Branch to end

endif: STRO Msg1,d ; Output the message "The largest of "
       DECO x,s ; Output x
       STRO Msg2,d ; Output the message " and "
       DECO y,s ; Output y
       STRO Msg3,d ; Output the message " is "
       DECO y,s ; Output the largest value
end:   ADDSP 4,i ; Deallocate space for #x and #y 
       STOP 
       .END 