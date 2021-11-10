.macro KPRINT str
        B 2f
str\@:
        .asciz "\str"
        .align 4
2:      STP X0, X1, [SP, #-16]!
        STP X2, X16, [SP, #-16]!
        STR LR, [SP, #-16]!
        ADR X0, str\@
        MOV X2, X0
3:      LDRB W1, [X0], #1
        CMP W1, #0
        B.NE 3b
        SUB X2, X0, X2          // len
        SUB X2, X2, #1
        ADR X1, str\@
        MOV X16, #4             // write
        MOV X0, #1              // stdin
        SVC 0
        LDR LR, [SP], #16
        LDP X2, X16, [SP], #16
        LDP X0, X1, [SP], #16
.endm   
