GCCPARAMS = -ffreestanding -mno-red-zone -m64 -c

objects = mb_boot_stub.o boot.o kernel.o

%.o : %.c
	x86_64-elf-gcc $(GCCPARAMS) -o $@ $<

%.o : %.asm
	nasm -f elf64 $*.asm -o $*.o

# kernel.bin: linker.ld $(objects)
# 	ld -n -T linker.ld -o kernel.bin $(objects)
kernel.bin: bootloader.asm
	nasm bootloader.asm -f bin -o kernel.bin

env:
	# escape $ to $$ in Makefile
	docker run --rm -it -v "$$PWD":/root/env myos-buildenv

install: kernel.bin
	dd if=/dev/zero of=boot.img bs=512 count=2880 &&\
	dd if=kernel.bin of=boot.img bs=512 count=1 conv=notrunc

run: install
	qemu-system-x86_64 -fda boot.img -boot a

clean:
	rm -rf *.bin
	rm -rf *.o