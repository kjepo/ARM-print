#include "print.h"

        .text
        .global _main
_main:  
        KPRINT "hello, world\n"
	KPRINT "goodbye cruel world\n"
        
        // exit
        MOV   X0, #0                    
        MOV   X16, #1                   
        SVC   0
