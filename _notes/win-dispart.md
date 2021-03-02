# Diskpart 

diskpart is a command-line disk partitioning utility included in Windows 2000 and later Microsoft OS

We can use it to create virtual disk

```
dispart        # open dispart

# create a vdisk d:\test.vhd
# max size = 10M
DISKPART> create vdisk file=d:\test.vhd maximum=10 type=fixed
```