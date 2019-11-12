#include <stdio.h>

unsigned modk(unsigned x, unsigned k) {
  return (x & ((1 << k) - 1));
}

unsigned divk(unsigned x, unsigned k) {
  return (x >> k);
}

unsigned modulo(unsigned x) {
  unsigned r, q, k, a, m, z;
  m = 0xB3; // 179
  k = 8;
  a = (1 << k) - m;
  r = modk(x, k);
  q = divk(x, k);
  do {
    do {
      r = r + modk(q * a, k);
      q = divk(q * a, k);
    } while (q != 0);
    q = divk(r, k);
    r = modk(r, k);
  } while (q != 0);
  z = (r >= m) ? r - m : r;
  return z;
}

unsigned prod(unsigned a) {
  unsigned i, p = 1;
  for (i=0; i<a; i++)
    p = modulo(p * i);
  return i;
}

void main() {
  unsigned i, j;
  unsigned extended_profile = 0;
  
  if (extended_profile) {
    for (i=0; i<1000; i++)
      for (j = 1; j< 179; j++)
	prod(j);
  } else {
    for (j = 1; j< 179; j++)
      printf("%d %d\n", j, prod(j));
  }
  
}
