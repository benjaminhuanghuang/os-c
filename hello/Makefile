

os:
	nasm hello.asm -o boot.bin

# Create vhd using win dispart
# write boot.bin to first partion of the vhd
install:
	dd if=boot.bin of=f:\os.vhd bs=512 count=1

run:
	# Load vhd in virtual box


