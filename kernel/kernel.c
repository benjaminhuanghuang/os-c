void print(char *);



void kernelMain(const void *multiboot_structure, unsigned int magic)
{
  print("hello world-----!!!\n");
  while (1);
}


void print(char *str)
{
  unsigned short *videoMemory = (unsigned short *)0xb8000;

  for (int i = 0; str[i] != '\n'; i++)
  {
    videoMemory[i] = (videoMemory[i] & 0xFF00) | str[i];
  }
}
