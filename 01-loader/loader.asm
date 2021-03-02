LOADER_BASE_ADDR equ 0x900
section loader vstart=LOADER_BASE_ADDR

mov ax, 0xb800  ; text mode
mov es, ax

mov byte [es:0x00], 'O'
mov byte [es:0x01], 0x07 
mov byte [es:0x02], 'K'
mov byte [es:0x03], 0x06

times 510 - ($-$$) db 0
dw 0xaa55