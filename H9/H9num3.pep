BR main

num1: .block 2   ;global variable #2d
num2: .block 2   ;global variable #2d
num3: .block 2   ;global variable #2d
result: .block 2 ;global variable #2d

space: .ascii "\n\x00"   
times: .ascii " multiplied by 8 is \x00" 
divided: .ascii " divided by 4 is \x00"   
addten: .ascii " plus 10 is \x00"    
total: .ascii "total is \x00"     

plus: .EQUATE 10 ;equate to add 10

main:  deci num1, d             ; Input the first num
       deci num2, d             ; Input the second num
       deci num3, d             ; Input the third num
       deco num1, d             ; Output num1 multiplied by 8
       stro times, d            ; " multiplied by 8 is \x00"
       lda num1, d              ; Load num1
       ASLA                     ; Multiply num1 by 2
       ASLA                     ; Multiply num1 by 4
       ASLA                     ; Multiply num1 by 8
       sta num1, d            ; Store result
       deco num1, d           ; Output result
       STRO space, d          ; "\n\x00" 

       deco num2, d             ; Output num2 Divide by 4
       stro divided, d          ; " divided by 4 is \x00"
       lda num2, d              ; Load num2
       ASRA                     ; divided num2 by 2
       ASRA                    ; divided num2 by 4
       sta num2, d            ; Store result
       deco num2, d           ; Output result
       stro space, d          ; Output space
       
       deco num3, d             ; Output num3 add by 10
       stro addten, d          ; " plus 10 is \x00" 
       lda num3, d              ; Load num3
       ADDA plus, i             ; add num3 by 10
       sta num3, d            ; Store result
       deco num3, d           ; Output result
       STRO space, d          ; Output space
 
       stro total, d            ; "total is \x00"
       lda num1, d              ; Load result of num1
       adda num2, d             ; Add result of num 2
       adda num3, d             ; Add result of num 3
       sta result, d            ; Store overall result
       deco result, d           ; Output total

       stop                      ; End
      .end