# MBR and loader

MBR is the first 512 bytes on the disk
loader was written to second partion on disk

```
  dd if=mbr.bin of=f:\os.vhd bs=512 count=1
	dd if=loader.bin of=f:\os.vhd bs=512 count=1 seek=2
```

BIOS load MBR to 0x7C00 and execute it.

MBR load loader to 0x9000 and execute it