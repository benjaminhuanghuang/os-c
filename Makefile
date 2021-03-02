GCCPARAMS = -m64

objects = mb_boot_stub.o boot.o kernel.o

env:
	# escape $ to $$ in Makefile
	docker run --rm -it -v "$$PWD":/root/env myos-buildenv

kernel.bin: 
	cd kernel &&\
	make

iso: kernel.bin
	cp kernel/kernel.bin iso/boot/kernel.bin &&\
	grub-mkrescue /usr/lib/grub/i386-pc -o os.iso iso

run:
	qemu-system-x86_64 -cdrom os.iso

clean:
	rm -rf kernel/*.bin
	rm -rf kernel/*.o