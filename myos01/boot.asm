global start
global myprint

extern kernelMain

section .text
bits 64
start: 
  call kernelMain

  hlt
myprint:
  mov dword [0xb8000], 0x2f4b2f4f
  ret

section .bss  ; statically allocated variables
stack_bottm:
  resb 4096 * 4
stack_top:
