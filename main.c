#include "libb2/src/blake2.h"
#include <string.h>

extern void storageStore(const uint32_t *keyOffset, const uint32_t *valueOffset);

extern void printStorage(const uint32_t *keyOffset);

int main(int argc, char **argv) {
  uint32_t value[64];
  uint32_t key[1];
  memset(value, 255, sizeof(value)*4);
  memset(key, 0, sizeof(key)*4);

  storageStore(key, value);
  printStorage(key);

  return 0;
}
