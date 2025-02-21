BR main
worked: .EQUATE 0 
hourly: .ASCII "Hourly wage: $16\n\x00"
work: .ASCII "Hours worked: \x00"
newline: .ASCII "\n\x00"
wages: .ASCII "\nWages received: $\x00"

main: SUBSP 2,i ; Allocate space for #worked
      DECI worked,s ; Input hours 

      LDA worked,s ; Load hours worked 
      CPA 40,i ; Compare with 40
      BRLE no_overt ; If hours worked <= 40, branch to no_overtime 

      LDA worked,s ; Load hours worked
      SUBA 40,i ; Subtract 40
      ASLA ; Double remainder 
      ASLA
      ASLA
      ASLA
      ASLA
      ADDA 640,i ; Add back the first 40 hours
      BR Print ; Go to print wages 

no_overt: ASLA ; Hours worked <= 40, so no overtime pay 
             ASLA
             ASLA 
             ASLA

Print:  STRO hourly,d ; Output hourly wage
        STRO work,d ; Output hours worked 
        DECO 640,s ; Calculate and output total wages
        STRO wages,d
        DECO 16,s ; Output total wages
        ADDSP 2,i ; Deallocate space for #worked
        STOP 
        .END ; End of program