global start
extern kernelMain

section .text
bits 64
start:
  ;print ok in green 
  mov dword [0xb8000], 0x2f4b2f4f
  ;mov esp, stack_top
  ;push eax
  ;push ebx
  ;call kernelMain

  hlt

section .bss  ; statically allocated variables
stack_bottm:
  resb 4096 * 4
stack_top:
