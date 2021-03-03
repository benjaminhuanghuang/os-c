

os:
	nasm int10.asm -o boot.bin

install:
	dd if=/dev/zero of=boot.img bs=512 count=2880
	dd if=boot.bin of=boot.img bs=512 count=1 conv=notrunc

run: install
	# Load vhd in virtual machine
	qemu-system-x86_64 -fda boot.img -boot a


