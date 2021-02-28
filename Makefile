env:
	# escape $ to $$ in Makefile
	docker run --rm -it -v "$$PWD":/root/env myos-buildenv

stub.o:
	nasm  -f elf64 ./kernel/mb_boot_stub.asm -o ./kernel/stub.o

boot.o:
	nasm -f elf64 ./kernel/boot.asm -o ./kernel/boot.o

kernel.bin: stub.o boot.o
	ld -n -o ./kernel/kernel.bin -T ./kernel/linker.ld ./kernel/stub.o ./kernel/boot.o

iso: kernel.bin
	cp kernel/kernel.bin iso/boot/kernel.bin && \
	grub-mkrescue /usr/lib/grub/i386-pc -o os.iso iso

run:
	qemu-system-x86_64 -cdrom os.iso

clean:
	rm -rf *.bin