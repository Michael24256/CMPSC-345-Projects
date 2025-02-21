0000 31 00 13 ;input first number to memory ;ERROR: Line must start with symbol definition, mnemonic, dot command, or comment.
0003 31 00 15 ;input second number to memory
0006 C1 00 13 ;load A with first number
0009 71 00 15 ;add second number to A
000C E1 00 17 ;store contents of A to memory 
000F 39 00 17 ;output result from memory
0012 00 
0013 00 00
0015 00 00
0017 00 00

;decimal input trap 0011 0aaa, 0011 0001, 31
;decimal output trap 0011 0aaa, 0011 1001, 39

;load A 1100 raaa 1100 0001, C1
;add to A 0111 raaa 0111 0001, 71
;store r to memory 1100 raa, 1110 0001, E1

