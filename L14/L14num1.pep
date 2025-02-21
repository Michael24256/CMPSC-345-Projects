br main
num: .EQUATE 0
sum: .EQUATE 2
msg: .ASCII "The sum is: \x00"

main:SUBSP 4,i ;allocate #sum #num
LdA 0,i
STA sum,s
DECI num,s

while: LDA num,s
CPA 0,i
breq endWHILE
ADDA num,s
STA sum,s
LDA sum,s
SUBA 1,i
STA num,s
BR while 

endWHILE:  STRO msg,d
DECO sum,s
ADDSP 4,i ;deallocate #num #sum
stop
.end
