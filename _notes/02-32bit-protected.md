
实模式: 段寄存器*16+位移寄存器 
20位地址总线能访问 2^20 = 1M

32位保护模式使每一app可以有独立的4G空间

```
; base :dd
; limit: dd (low 20 bits availiable)
; attr : dd (low 4 bits of higher byte are always 0)

%macro Descriptor 3
	dw %2 & 0FFFFh	;段界限1 （2字节）
	dw %1 & 0FFFFh	;段基址1 (2字节）
	db (%1 >> 16) & 0FFh	;段基址2 （1字节）
	dw ((%2 >> 8) & 0F00h) | (%3 &0F0FFh) ;属性1 + 段界限2+属性2 （2字节）
	db (%1 >> 24) & 0FFh	;段基址3
%endmacro
```
CS, DS 这些16位模式下的段寄存器， 不再是段基址，而变成了 段选择子

只有 段选择子 与 段描述结合才能访问物理地址

## GDT 全局描述符


GDTR

1. 初始化GDT
2. 用lgdt 把 GDT 加载 到内存中
3. 关中断
```
  cli
```
3. 打开A20
```
  in al, 92h
  or al, 00000010b
  out 92h, al
```
4. 打开CR0寄存器 PE=0实模式 PE=1保护模式

5. jump 进入 protected mode

