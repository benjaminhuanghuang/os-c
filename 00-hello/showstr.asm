  org 07c00h       ; load bin to 0x7c00
  mov ax, cs
  mov ds, ax
  mov es, ax
  call entry
  jmp $

entry:
  mov ax, msg
  mov bp, ax      ; ES:BP = string address
  mov cx, 16      ; CX = string length
  mov ax, 1301h   ; AH =13, AL=01h
  mov bx, 000ch   ; BH =0, BL=0CH (red,black)
  mov dl, 0
  int 10h

msg: 
  db "Hello world", 0
  
  times 510-($-$$) db 0
  dw 0xaa55

