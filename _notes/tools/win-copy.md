
Merge two bin files
```
  nasm a.asm -f bin -o a.bin
  nasm b.asm -f bin -o b.bin

  copy /b a.bin+b.bin boot.bin

```