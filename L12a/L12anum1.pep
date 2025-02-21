BR main

intx: .EQUATE 0 ; Local variable #2d
inty: .EQUATE 2 ; Local variable #2d
intz: .EQUATE 4 ; Local variable #2d
intx2: .EQUATE 6 ; Local variable #2d
inty2: .EQUATE 8 ; Local variable #2d
result: .EQUATE 10; Local variable #2d

Space: .ascii "\n\x00"   
msg: .ascii "x times 2 is \x00"   
msg2: .ascii "y divided by 2 is \x00"   
msg3: .ascii "x plus y minus z is \x00"   

main: SUBSP 12, i ; Allocate #result #inty2 #intx2 #intz #inty #intx 

   
    DECI  intx, s     ; Input an x int
    DECI  inty, s     ; Input an y int
    DECI  intz, s     ; Input an z int

    
    LDA   intx, s     ; Load the x input numb
    ASLA              ; mult by 2
    STA   intx2, s    ; Store x2 on the stack

 
    LDA   inty, s     ; Load the ys input number
    ASRA              ; divide by 2
    STA   inty2, s    ; Store y2 on the stack


    LDA  intx, s     ; Load the x input number 
    ADDA  inty, s     ; Add y
    SUBA  intz, s     ; Subtract z
    STA   result, s   ; Store result on stack

    
    STRO msg, d       ; "x times 2 is \x00"
    DECO  intx2, s    ; Output x2
    STRO Space, d     ; "\n\x00"
    STRO msg2, d      ; "y divided by 2 is \x00"
    DECO  inty2, s    ; Output y2
    STRO Space, d     ; "\n\x00"
    STRO msg3, d      ; "x plus y minus z is \x00"
    DECO  result, s   ; result

    ADDSP 12, i ; Deallocate #intx #inty #intz #intx2 #inty2 #result 
    STOP
    .END