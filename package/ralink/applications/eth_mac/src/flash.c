#include <stdlib.h>             
#include <stdio.h>             
#include <string.h>           
#include <sys/ioctl.h>
#include <fcntl.h>
#include <getopt.h>

#include "flash_ioctl.h"
#include "flash_api.h"

void show_usage(void)
{
    printf("flash -r [offset(hex)] -c [num of bytes]\n");
    printf("  READ => flash -r 370000 -c 4\n\n");
    printf("flash -w [offset(hex)] -o [1 byte value(hex)] \n");
    printf("  WRITE=> flash -w 370000 -o 0c \n\n");
    printf("flash -f [start addr] -l [end addr]\n");
    printf("  ERASE=> flash -f 30000 -l 3ffff \n\n");
}

int main(int argc, char *argv[])
{
    int opt;
    char options[] = "r:w:f:l:o:c:?";
    int fd, method;
    unsigned char buffer[FLASH_MAX_RW_SIZE];
    int i=0;
    unsigned int    *src;
    unsigned int    *dst;
    unsigned int    value;
    unsigned int    bytes;
    unsigned int    start_addr;
    unsigned int    end_addr;

    if (argc < 3) {
	show_usage();
	return 0;
    }

    while ((opt = getopt (argc, argv, options)) != -1) {
	switch (opt) {
	case 'r':
	    dst = (unsigned int *)buffer;
	    src = (unsigned int *)strtol(optarg, NULL, 16);
	    method = FLASH_IOCTL_READ;
	    break;
	case 'w':
	    dst = (unsigned int *)strtol(optarg, NULL, 16);
	    method = FLASH_IOCTL_WRITE;
	    break;
	case 'f':
	    start_addr=strtol(optarg, NULL, 16);
	    method = FLASH_IOCTL_ERASE;
	    break;
	case 'l':
	    end_addr=strtol(optarg, NULL, 16);
	    method = FLASH_IOCTL_ERASE;
	    break;
	case 'c':
	    bytes=strtol(optarg,NULL,10);
	    if(bytes > FLASH_MAX_RW_SIZE) {
		printf("Too many bytes - %d > %d bytes\n", bytes, FLASH_MAX_RW_SIZE);
		return 0;
	    }
	    break;
	case 'o':
	    value=strtol(optarg, NULL, 16);
	    break;
	case '?':
	    show_usage();

	}
    } 

    switch(method) 
    {
    case FLASH_IOCTL_READ:
	if(FlashRead(dst,src, bytes)<0){
	    printf("READ: Out of scope\n");
	}else {
	    for(i=0;i<bytes;i++) {
		printf("%X: %X\n", ((unsigned int)src)+i, buffer[i]);
	    }
	}
	break;
    case FLASH_IOCTL_WRITE:
	if(FlashWrite(&value, dst, 1)<0) {
	    printf("WRITE: Out of scope\n");
	}else {
	    printf("Write %0X to %0X\n", value, dst);
	}
	break;
    case FLASH_IOCTL_ERASE:
	if(end_addr<start_addr){
		printf("ERASE: End addr MUST bigger than Start addr\n");
		break;
	}

	if(FlashErase(start_addr, end_addr)<0) {
		printf("ERASE: Out of scope\n");
	}else {
		printf("Erase Addr From %0X To %0X\n",start_addr, end_addr);
	}
	break;
    }	

    return 0;


}
