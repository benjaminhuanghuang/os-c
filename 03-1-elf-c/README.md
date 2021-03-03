# C code, elf

Tools
  - 

```
  gcc -o printf.exe printf.c
```
执行
```
  strace ./printf.exe
```
可以看到printf.exe执行了若干系统调用

执行
```
  file ./printf.exe
```
可以看到
```
printf.exe: ELF 64-bit LSB shared object, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 2.6.32, BuildID[sha1]=871fd2f49e827a91b6e1d1c85e8b79b7447a756d, not stripped
```

OS 会规定一个 程序 被加载以及开始执行的 逻辑地址

执行
```
  readelf -a ./printf.exe
```
可以看到
```
  Entry point address:               0x580
```
执行 
```
   hexdump printf.exe
```
可以看到文件的开始 4个字节：7F 45 4C  46  
是ELF文件的Magic number 45, 4C, 46 是 elf 的ASCII code