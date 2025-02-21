BR main

char1: .EQUATE 0 ; Local variable #1c
char2: .EQUATE 1 ; Local variable #1c
char3: .EQUATE 2 ; Local variable #1c
char4: .EQUATE 3 ; Local variable #1c

main: SUBSP 4, i ; Allocate #char4 #char3 #char2 #char1

    
    CHARI char1, s       ; Input first char
    CHARI char2, s       ; Input second char
    CHARI char3, s       ; Input third char
    CHARI char4, s       ; Input fourth char

    
    CHARO char4, s       ; Output fourth char
    CHARO char3, s       ; Output third char
    CHARO char2, s       ; Output second char
    CHARO char1, s       ; Output first chara

    ADDSP 4, i ; Deallocate #char1 #char2 #char3 #char4
    STOP
    .END