BR main        
num:     .equate 0           ;Local variable #2d
num1:    .equate 2           ;Local variable #2d
result:  .equate 4           ;Local variable #2d
msg:     .ASCII  " multiplied by 4 is \x00"

;Method multi4
multi4:  LDA     num1,s      ;Load num into the ACC
         ASLA                ;Multiply by 2
         ASLA                ;Multiply by 4
         STA     result,s    ;Store the result
         RET0  
              
;Main method
main:    SUBSP   2,i         ;Allocate #num
         DECI    num,s       ;Input integer for num
         LDA     num,s       
         STA     -4,s       
         SUBSP   4,i         ;push #result #num1 
         CALL    multi4      ;call mutli4 method
         deco    num,s     
         stro    msg,d
         DECO    2,s         ;Output result
         ADDSP   4,i         ;pop #num1 #result
         addsp   2,i         ;deallocate #num
stop                
.end