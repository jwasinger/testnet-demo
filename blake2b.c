#include "libb2/src/blake2.h"
//#include <string.h>
//#include <stdint.h>

extern void storageStore(const uint32_t *keyOffset, const uint32_t *valueOffset);

extern void printStorage(const uint32_t *keyOffset);

void *memset(void *dst, int c, size_t n)
{
  if (n) {
    char *d = dst;

    do {
      *d++ = c;
    } while (--n);
  }
  return dst;
}


int main(int argc, char **argv) {
  //unsigned int value[64];
  //unsigned int key[1];
  //memset(value, 255, sizeof(value)*4);
  //memset(key, 0, sizeof(key)*4);

  //storageStore(key, value);
  //printStorage(key);

  return 0;
}
