

## Crate virtual disk
```
  bximage
```

## config file
https://blog.nswebfrog.com/2017/02/03/config-bochs/
``` 
  # how much memory the emulated machine will have
  megs: 32

  # filename of ROM images
  romimage: file=$BXSHARE/BIOS-bochs-latest
  vgaromimage: file=$BXSHARE/VGABIOS-lgpl-latest

  # what disk images will be used
  floppya: 1_44=helloOS.img, status=inserted

  # choose the boot disk.
  boot: floppy

  # where do we send log messages?
  # log: bochsout.txt

  # disable the mouse
  mouse: enabled=0

  # enable key mapping, using US layout as default.
  keyboard: keymap=$BXSHARE/keymaps/sdl-pc-us.map
```

## Start
```
  bochs -f bochsrc
```

## Debug command
continue
```
c
```

add break point
```
  b  0x7c00
```

```
  info cpu
```