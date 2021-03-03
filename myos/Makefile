GCCPARAMS = -ffreestanding -mno-red-zone -m64 -c

objects = mb_boot_stub.o boot.o kernel.o

%.o : %.c
	x86_64-elf-gcc $(GCCPARAMS) -o $@ $<

%.o : %.asm
	nasm -f elf64 $*.asm -o $*.o

kernel.bin: linker.ld $(objects)
	ld -n -T linker.ld -o kernel.bin $(objects)

env:
	# escape $ to $$ in Makefile
	docker run --rm -it -v "$$PWD":/root/env myos-buildenv

iso: kernel.bin
	cp kernel.bin iso/boot/kernel.bin &&\
	grub-mkrescue /usr/lib/grub/i386-pc -o os.iso iso

run:
	qemu-system-x86_64 -cdrom os.iso

clean:
	rm -rf *.bin
	rm -rf *.o