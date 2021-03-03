PROGRAM_SPACE equ 0x7a00


ReadDisk:
  mov bx, PROGRAM_SPACE
  mov al, 4           ; read 4 sectors
  mov dl, [BOOT_DISK]  ; read which disk
  mov ch, 0x0          ; cylinder
  mov dh, 0x0          ; header
  mov cl, 0x2          ; from 2nd sector

  int 0x13     

  jc DiskReadFailed

  ret

BOOT_DISK:
  db 0

diskerror:
  db "Disk error", 0

DiskReadFailed:
  mov bx, diskerror
  call PrintString
  jmp $
