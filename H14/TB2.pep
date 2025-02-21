br main 

num: .EQUATE 0 ;local variable #2d
total: .EQUATE 2 ;local variable #2d
month: .ASCII "Your Total Monthly Fee is: $\x00"

main: subsp 4,i ;Allocate space for #total #num
LDA total,s
ADDA 10,i
STA total,s
DECI num,s
LDA num,s
CPA 20,i
BRLT less
BR greater

less: LDA total,s
ADDA 5,i
STA total,s
STRO month,d
DECO total,s
addsp 4,i ;Deallocate #num #total
stop

greater: LDA total,s
ADDA 8,i
STA total,s
STRO month,d
DECO total,s
addsp 4,i ;Deallocate space for #num #total

stop
.end