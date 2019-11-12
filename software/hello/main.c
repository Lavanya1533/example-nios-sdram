#include "system.h"
#include <stdio.h>


void main() {

  printf("Hello World\n");
  
  volatile unsigned int *HEX = (unsigned int *) PIO_0_BASE;
  unsigned int i;

  volatile unsigned int *j = (unsigned int *) 0x0;
  for (i = 0; i<1000; i++) {    
    *HEX = i;
    printf("%d\n", i);
  }

  usleep(500000);
  exit(0);

}
