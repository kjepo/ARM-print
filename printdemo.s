#include "print.h"

	.text
	.global _main
_main:	
	KPRINT hello
	B _exit
	KSTRING hello, "hello, world\n"
	
_exit:	
	MOV   X0, #0      		
	MOV   X16, #1     		
	SVC   0
