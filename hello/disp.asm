mov ax, 0xb800 ; text mode  80*25
mov es, ax

mov byte [es:0x00], 'I'
mov byte [es:0x01], 0x07 
mov byte [es:0x02], 'L'
mov byte [es:0x03], 0x06

times 510 - ($-$$) db 0
dw 0xaa55


