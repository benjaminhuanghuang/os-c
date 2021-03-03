
Create floppy disk
```
  dd if=/dev/zero of=boot.img bs=512 count=2880
```

Write MBR
```
	dd if=boot.bin of=boot.img bs=512 count=1 conv=notrunc
	dd if=boot.bin of=boot.img bs=512 count=1 seek=1
```