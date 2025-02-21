0000 31 00 12; input integer to memory
0003 C1 00 12; load into the A
0006 1C; ASL
0007 1C; ASL
0008 71 00 12 ; add integer to A
000B E1 00 14; store in memory 
000E 39 00 14; output form memory 
0011 00
0012 00 00
0014 00 00


;input decimal 0011 0aaa. 0011 0001 31
;load r 1100 raaa 1100 0001 C1
;ASL 0001 110r 0001 1100 1C
;add to A 0111 raaa 0111 0001 71
;store 1110 raaa 1110 0001 E1
;output integer 0011 1aaa 0011 1001 39