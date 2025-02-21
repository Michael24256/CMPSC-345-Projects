BR main
worked: .EQUATE 0 
hourly: .ASCII "Hourly wage: $16\n\x00"
work: .ASCII "Hours worked: \x00"
newline: .ASCII "\n\x00"
wages: .ASCII "\nWages received: $\x00"

main: SUBSP 2,i ; Allocate #worked
      DECI worked,s ;Input hrs

if: LDA worked,s ;Load hours worked in acc
    CPA 40,i ; Compare with 40 hours
    BRLE else ; If hours worked <= 40
    LDA worked,s ; Load hoursworked
    SUBA 40,i ; Sub 40
    LDX 1,i ;Load X to multiple for loop1


else: LDX 1,i ;Load X to multiple for loop2
      
Loop1: ASLA ;Overtime rate 
       ADDX 1,i ;add x
       CPX 5,i ; loops ASLA 5 times
       BRLE Loop1
       ADDA 640,i ; Add back the first 40 hours
       BR Print 


Loop2: ASLA ;Hours worked <= 40, so no overtime pay
       ADDX 1,i ;add x
       CPX 4,i  ;loops ASLA 4 times
       BRLE Loop2 ;branches to loop2
      

Print:  STRO hourly,d 
        STRO work,d 
        DECO 0,s ;Output total wages
        STA worked,s 
        STRO wages,d
        DECO 0,s ;Output total wages
        ADDSP 2,i ;Deallocate #worked
stop 
.end