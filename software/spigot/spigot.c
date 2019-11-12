// Print pi to n decimal places (default 1000): pi n
// spigot based on https://cs.fit.edu/~mmahoney/cse3101/pi.c.txt

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void print(unsigned short *pi, int n) {
  int i;
  printf("%d.", pi[1]);
  for (i=2; i<n-1; ++i)
    printf("%04d", pi[i]);
  printf("\n");
}

int main( ) {
  int n = 50;  /* number of pi digits */
  unsigned short *pi = (unsigned short*) malloc(n * sizeof(unsigned short));
  div_t d;
  int i, j, t;

  memset(pi, 0, n*sizeof(unsigned short));
  pi[1]=4;
  
  for (i=(int)(3.322*4*n); i>0; --i) {
    
    t = 0;
    for (j=n-1; j>=0; --j) { 
      t += pi[j] * i;
      pi[j] = t % 10000;
      t /= 10000;
    }
    
    d.quot = 0;
    d.rem = 0;
    for (j=0; j<n; ++j) {  
      d = div(pi[j]+d.rem*10000, i+i+1);
      pi[j] = d.quot;
    }
    
    pi[1] += 2;
  }
  
  print(pi, n);
  return 0;
}
