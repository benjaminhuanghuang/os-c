
 https://wiki.osdev.org/Multiboot

Multiboot 1 compliant kernels used the magic number 0x1BADB002, 
Multiboot 2 use 0xE85250D6

```
grub-file --is-x86-multiboot myos.bin

grub-file --is-x86-multiboot2 myos.bin
```


