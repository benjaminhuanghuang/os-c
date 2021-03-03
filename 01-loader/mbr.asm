	[org 0x7c00]

	move bx, msg

	call PrintString

	jmp $

	%include "print.asm"


msg:
	db "We are in extended space", 0
	
	times 510 - ($-$$)	db 0
	dw 0xaa55
	
	

	
	
	
	
	
	
	
	