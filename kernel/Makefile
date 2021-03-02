GCCPARAMS = -m64

objects = mb_boot_stub.o boot.o kernel.o

%.o : %.c
	gcc $(GCCPARAMS) -c -o $@ $<

%.o : %.asm
	nasm -f elf64 $*.asm -o $*.o

kernel.bin: linker.ld $(objects)
	ld -n -T linker.ld -o kernel.bin $(objects)
