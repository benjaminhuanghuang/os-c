#include <unistd.h>

int main(void){
  write(1, "Hello\n", 6);  // write 6 chars to stdout
  return 0;
}