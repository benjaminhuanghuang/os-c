[org 0x7c00]

  ; BIOS stores the disk number that the program was loaded from into dl
  ; Store it into BOOT_DISK in bootloader.asm
  mov [BOOT_DISK], dl
  mov bp, 0x7c00
  mov sp, bp

  mov bx, TestString
  call PrintString
  call ReadDisk
  
  jmp 0x7a00

%include "print.asm"
%include "diskreader.asm"
	
	times 510 - ($-$$)	db 0
	dw 0xaa55