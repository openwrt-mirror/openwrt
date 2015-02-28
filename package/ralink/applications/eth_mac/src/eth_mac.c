#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <signal.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdint.h>
#include <sys/ioctl.h>
#include <sys/types.h>
#include <linux/autoconf.h>  //kernel config

#define MTD_FACTORY 	"/dev/mtd3"
#if defined (CONFIG_RALINK_RT6855A) || defined (CONFIG_RALINK_MT7621)
#define LAN_OFFSET    0xE000
#define WAN_OFFSET    0xE006
#else
#define LAN_OFFSET    0x28 
#define WAN_OFFSET    0x2E
#endif

#define MACADDR_LEN 	6
#define WIFIRF_LEN 	512

#define MEMGETINFO	_IOR('M', 1, struct mtd_info_user)
#define MEMERASE	_IOW('M', 2, struct erase_info_user)
#define MEMUNLOCK	_IOW('M', 6, struct erase_info_user)

struct erase_info_user {
	unsigned int start;
	unsigned int length;
};

struct mtd_info_user {
	unsigned char type;
	unsigned int flags;
	unsigned int size;
	unsigned int erasesize;
	unsigned int oobblock;  
	unsigned int oobsize;  
	unsigned int ecctype;
	unsigned int eccsize;
};

int mtd_read(char *side)
{
	int fd = open(MTD_FACTORY, O_RDWR | O_SYNC);
	int i = 0;
	unsigned char mac_addr[MACADDR_LEN];

	if(fd < 0) {
		printf("Could not open mtd device: %s\n", MTD_FACTORY);
		return -1;
	}

	if (!strcmp(side, "wan"))
		lseek(fd, WAN_OFFSET, SEEK_SET);
	else
		lseek(fd, LAN_OFFSET, SEEK_SET);
	if(read(fd, mac_addr, MACADDR_LEN) != MACADDR_LEN){
		printf("read() failed\n");
		close(fd);
		return -1;
	}
	for (i = 0; i < MACADDR_LEN; i++)
	{
		printf("%02X", mac_addr[i]);
		if (i < MACADDR_LEN-1)
			printf(":");
		else
			printf("\n");
	}
	close(fd);

	return 0;
}

int mtd_write(char *side, char **value)
{
	int sz = 0;
	int i;
	struct mtd_info_user mtdInfo;
	struct erase_info_user mtdEraseInfo;
	int fd = open(MTD_FACTORY, O_RDWR | O_SYNC);
	unsigned char *buf, *ptr;
	if(fd < 0) {
		fprintf(stderr, "Could not open mtd device: %s\n", MTD_FACTORY);
		return -1;
	}
	if(ioctl(fd, MEMGETINFO, &mtdInfo)) {
		fprintf(stderr, "Could not get MTD device info from %s\n", MTD_FACTORY);
		close(fd);
		return -1;
	}
	mtdEraseInfo.length = sz = mtdInfo.erasesize;
	buf = (unsigned char *)malloc(sz);
	if(read(fd, buf, sz) != sz){
		fprintf(stderr, "read() %s failed\n", MTD_FACTORY);
		goto write_fail;
	}
	mtdEraseInfo.start = 0x0;
	mtdInfo.size = sz;
	for (mtdEraseInfo.start; mtdEraseInfo.start < mtdInfo.size; mtdEraseInfo.start += mtdInfo.erasesize) {
		ioctl(fd, MEMUNLOCK, &mtdEraseInfo);
		if(ioctl(fd, MEMERASE, &mtdEraseInfo)){
			fprintf(stderr, "Failed to erase block on %s at 0x%x\n", MTD_FACTORY, mtdEraseInfo.start);
			goto write_fail;
		}
	}		
	if (!strcmp(side, "wan"))
		ptr = buf + WAN_OFFSET;
	else
		ptr = buf + LAN_OFFSET;
	for (i = 0; i < MACADDR_LEN; i++, ptr++)
		*ptr = strtoul(value[i], NULL, 16);
	lseek(fd, 0, SEEK_SET);
	if (write(fd, buf, sz) != sz) {
		fprintf(stderr, "write() %s failed\n", MTD_FACTORY);
		goto write_fail;
	}

	close(fd);
	return 0;
write_fail:
	close(fd);
	free(buf);
	return -1;
}

void usage(char **str)
{
	printf("How to use:\n");
	printf("\tread:   %s r <lan|wan>\n", str[0]);
	printf("\twrite:  %s w <lan|wan> <MACADDR[0]> <MACADDR[1]> ...\n", str[0]);
}

int main(int argc,char **argv)
{
	char op;

	if (argc < 3)
		goto CmdFail;

	op = *(argv[1]);
	switch (op) {
	case 'r':
		if (mtd_read(argv[2]) < 0)
			goto Fail;
		break;
	case 'w':
		if (argc < 4)
			goto CmdFail;
		if (mtd_write(argv[2], argv+3) < 0)
			goto Fail;
		break;
	default:
		goto CmdFail;
	}

	return 0;
CmdFail:
	usage(argv);
Fail:
	return -1;
}

