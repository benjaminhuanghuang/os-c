  org 07c00h       ; load bin to 0x7c00
  mov ds, ax
  mov es, ax
  call entry
  jmp $
entry:
  mov ax, msg
  mov bp, ax
  mov cx, 16
  mov ax, 1301h
  mob bx, 000ch
  mov dl, 0
  int 10h

msg: db "Hello world"
times 510-($-$$) db 0
dw 0xaa55

