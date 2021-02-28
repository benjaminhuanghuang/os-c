global start

section .text
bits 64
start:
  ;print ok in green 
  mov dword [0xb8000], 0x2f4b2f4f
  hlt
