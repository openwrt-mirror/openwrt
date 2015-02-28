#ifndef __FLASH_API
#define __FLASH_API

int FlashRead(unsigned int *dst, unsigned int *src, unsigned int numBytes);
int FlashWrite(unsigned int *source, unsigned int *dest, unsigned int numBytes);
int FlashErase(unsigned int StartAddr, unsigned int EndAddr);

#endif
