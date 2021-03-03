# C kernel
假设想用C语言写一个kernel，编译如下
```
  gcc -o kernel.bin kernel.c
```
显然 kernel.bin 是一个ELF 文件， 执行
```
  file kernel.bin
```
可以看到elf 信息
执行
```
  readelf -a kernel.bin
```
可以看到
```
  Entry point address:               0x580
```

自制操作系统的执行流程通常是
BIOS 加载 mbr到 0x7c00并执行， mbr 加载 loader 某个可用的内存地址 并执行， loader加载kernel到某个可用的内存地址并执行

因此，`需要能够设定在编译时kernel.bin要加载的地址`

使用 -c 参数，告诉gcc只生成object文件，不链接
```
  gcc -o kernel.o -c kernel.c
```
此时用 readelf -a 可以看到 
```
  Entry point address:               0x0
```
然后可以使用ld 链接，指定段地址为0x1500
```
  ld kernel.o -s -Ttext 0x1500 -e main -o kernel.bin
```
可以用objdump查看
```
  objdump -D kernel.bin
```
可以看到 .text的地址为0x1500

但是 此时的 `kernel.bin`

objcopy用于将object的部分获全部内容拷贝到另一个object，从而转换elf文件为bin文件。
```
```
