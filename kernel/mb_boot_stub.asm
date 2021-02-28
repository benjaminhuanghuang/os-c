section .multiboot_header

mbh_start:
  dd 0xE85250D6    ; magic number
  dd 0             ; platform 0 : i386, 2 : mips
  dd mbh_end - mbh_start   ; header length
  ; checksum = -(magic number + architecture + header len)
  dd 0x100000000 -(0xE85250D6 + 0 + (mbh_end - mbh_start))
  
  ; multiboot header tags
  ; This gets imforamtion about the underlying system

   
  ; End tag to the header
  dw 0    ; end TYpee
  dw 0    ; end Flags
  dd 8    ; size


mbh_end:

