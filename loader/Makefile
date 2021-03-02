

mbr:
	nasm mbr.asm -o mbr.bin

loader:
	nasm loader.asm -o loader.bin

# Create vhd using win dispart
# write boot.bin to first partion of the vhd
# write loader.bin to section partion of the vhd
install:
	dd if=mbr.bin of=f:\os.vhd bs=512 count=1
	dd if=loaderr.bin of=f:\os.vhd bs=512 count=1 seek=2

run:
	# Load vhd in virtual box


