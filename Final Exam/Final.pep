br main 

sec: .equate 2 ;variable #2d
min: .equate 4 ;variable #2d
hrs: .equate 6 ;variable #2d

total: .equate 8 ;variable #2d

;variable for main
x: .equate 4 ;variable #2d
y: .equate 2 ;variable #2d
z: .equate 0 ;variable #2d
retval: .equate 0 ;variable #2d

;strings
output1: .ascii "There are \x00"
output2: .ascii " seconds in \x00"
output3: .ascii " hours, \x00"
output4: .ascii " minutes, and \x00"
output5: .ascii " seconds. \x00"

begin:   LDA hrs,s ;load hours
         LDX 6,i ; load index reg with 6
         BR hrcalc ;branch to hrcalc

hrcalc:  ASLA ; mult by 2
         SUBX 1,i ;sub 1 from index
         CPX 0,i
         BRLE inter ;brnach if less than or equal to
         BR hrcalc ;branch back to hrclac

inter:   ADDA min,s ;add minute to acc
         LDX 6,i ;load index reg with 6
         
mincalc: ASLA
         SUBX 1,i      
         CPX 0,i
         BRLE seccalc 
         BR mincalc         

seccalc: ADDA sec,s ;add sec to acc
         STA total,s ; store total seconds
         RET0 ;return 0



main:    subsp 6,i ;allocate #x #y #z
         DECI x,s ;input
         DECI y,s ;input
         DECI z,s ;input
         LDA x,s  ;load
         STA -4,s 
         LDA y,s  ;load
         STA -6,s
         LDA z,s  ;load
         STA -8,s
         subsp 8,i ;push #retval #x #y #z
         CALL begin
         addsp 6,i ;pop #x #y #z 
         STRO output1,d ;"There are"
         DECO retval,s
         addsp 2,i ;pop #retval
         STRO output2,d ;"seconds in"
         DECO x,s
         STRO output3,d ;"hours,"
         DECO y,s
         STRO output4,d ;"minute, and"
         DECO z,s
         STRO output5,d ;"seconds."
         addsp 6,i ;deallocate #z #y #x

stop
.end