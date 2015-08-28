#define BigEndian 1
#define LittleEndian 0

/*
void swapByteOrder(unsigned long long& ull)
{
    ull = (ull >> 56) |
          ((ull<<40) & 0x00FF000000000000) |
          ((ull<<24) & 0x0000FF0000000000) |
          ((ull<<8)  & 0x000000FF00000000) |
          ((ull>>8)  & 0x00000000FF000000) |
          ((ull>>24) & 0x0000000000FF0000) |
          ((ull>>40) & 0x000000000000FF00) |
          (ull << 56);
}
*/
/*mingw 4.3 add LL*/
static void swapByteOrder(unsigned long long& ull)
{
    ull = (ull >> 56) |
          ((ull<<40) & 0x00FF000000000000LL) |
          ((ull<<24) & 0x0000FF0000000000LL) |
          ((ull<<8)  & 0x000000FF00000000LL) |
          ((ull>>8)  & 0x00000000FF000000LL) |
          ((ull>>24) & 0x0000000000FF0000LL) |
          ((ull>>40) & 0x000000000000FF00LL) |
          (ull << 56);
}

static bool BigEndianTest()
{
    unsigned int usData = 0x12345678;
    unsigned char *pucData = (unsigned char*)&usData;
    if(*pucData == 0x78)
    {
        return LittleEndian;
    }
    else
    {
        return BigEndian;
    }
}

#define Swap16(s) ((((s) & 0xff) << 8) | (((s) >> 8) & 0xff))
#define Swap32(l) (((l) >> 24) |(((l) &0x00ff0000) >> 8)|(((l) &0x0000ff00) << 8) |((l) << 24))
#define Swap64(ll) (((ll) >> 56) |(((ll) & 0x00ff000000000000LL) >> 40) |(((ll) & 0x0000ff0000000000LL) >> 24) |(((ll) & 0x000000ff00000000LL) >> 8)|(((ll) & 0x00000000ff000000LL) << 8) |(((ll) & 0x0000000000ff0000LL) << 24) |(((ll) & 0x000000000000ff00LL) << 40) |(((ll) << 56)))


#define BigEndian_16(s) BigEndianTest() ? s : Swap16(s)
#define LittleEndian_16(s) BigEndianTest() ? Swap16(s) : s
#define BigEndian_32(l) BigEndianTest() ? l : Swap32(l)
#define LittleEndian_32(l) BigEndianTest() ? Swap32(l) : l
#define BigEndian_64(ll) BigEndianTest() ? ll : Swap64(ll)
#define LittleEndian_64(ll) BigEndianTest() ? Swap64(ll) : ll
