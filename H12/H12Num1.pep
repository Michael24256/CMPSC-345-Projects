BR main

int1: .EQUATE 0 ; Local variable #2d
int2: .EQUATE 2 ; Local variable #2d
int3: .EQUATE 4 ; Local variable #2d
sum: .EQUATE 6 ; Local variable #2d
msg: .ascii "The sum of \x00"    
msg2: .ascii ", \x00"            
msg3: .ascii "and, \x00"         
msg4: .ascii " is \x00"           

main: SUBSP 8, i ; Allocate #sum #int3 #int2 #int1

    
    DECI int1, s       ; Input int1 integer
    DECI int2, s       ; Input int2 integer
    DECI int3, s       ; Input int3 integer

   
    LDA int1, s        ; Load the int1 input number
    ADDA int2, s       ; Add int2 to the acc
    ADDA int3, s       ; Add int3 to the acc
    STA sum, s         ; Store sum on stack

    
    STRO msg, d        ; "The sum of \x00"
    DECO int1, s       ; Output int1
    STRO msg2, d       ; ", \x00"
    DECO int2, s       ; Output int2
    STRO msg2, d       ; ", \x00"
    STRO msg3, d       ; "and, \x00"
    DECO int3, s       ; Output int3
    STRO msg4, d       ; " is \x00"
    DECO sum, s        ; Output sum

    ADDSP 8, i ; Deallocate #int1 #int2 #int3 #sum
    STOP
    .END