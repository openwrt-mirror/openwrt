/*****************************************************************************
 * $File:  shdump.c 
 *
 * $Author: Hua Shao
 * $Date:   Aril, 2013
 *
 *****************************************************************************/

#include <stdio.h>
#include <string.h>
#include <errno.h>

typedef unsigned char byte;
typedef unsigned int  uint32;

void dump(byte     *p, 
		uint32   s, 
		byte     *base)
{
	int i, c;
	if ((uint32)s > (uint32)p) {
		s = (uint32)s - (uint32)p;
	}
	while ((int)s > 0) {
		if (base) {
			printf("%08X: ", (uint32)p - (uint32)base);
		} else {
			printf("%08X: ", p);
		}
		for (i = 0;  i < 16;  i++) {
			if (i < (int)s) {
				printf("%02X ", p[i] & 0xFF);
			} else {
				printf("   ");
			}
			if (i == 7) printf(" ");
		}
		printf(" |");
		for (i = 0;  i < 16;  i++) {
			if (i < (int)s) {
				c = p[i] & 0xFF;
				if ((c < 0x20) || (c >= 0x7F)) c = '.';
			} else {
				c = ' ';
			}
			printf("%c", c);
		}
		printf("|\n");
		s -= 16;
		p += 16;
	}
}

int usage()
{
	printf("Usage:\n"
			"\t shdump [options] <filename>\n"
			"Supported Options:\n"
			"\t -j N  \t skip N bytes\n"
			"\t -n N  \t dump up to N bytes\n"
	      );

	return -1;
}


int main(int argc, char ** argv)
{
	FILE * fp = NULL;
	char buf[1024] = {0};
	int skip  = 0;
	int size = 1024;
	int done = 0;
	int i = 0;
	char * path = NULL;

	if(argc<2 || 0 != argc%2)
		return usage();

	/* command line arguments */
#if 0
	i = 0;
	while(i<argc)
	{
		printf("argv[%d]:%s\n", i, argv[i]);
		i++;
	}
#endif
	i = 1;
	while(i<argc)
	{
		if(argv[i][0] == '-')
			if(i+1>=argc)
				return usage();

		if(0 == strcasecmp(argv[i],"-j"))
			skip = atoi(argv[i+1]);
		else if(0 == strcasecmp(argv[i],"-n"))
			size = atoi(argv[i+1]);
		else if(argv[i][0] == '-')
			return usage();
		else 
		{
			path = argv[i];
			i++;
			continue;
		}
		i += 2;
	}

	//printf("dump -n %d -j %d %s\n", size, skip, path);

	if(skip<0 || size<= 0 || !path)
		return usage();

	fp = fopen(path, "r");
	if(!fp)
	{
		printf("error: %s. \n", strerror(errno));
		return -1;
	}

	fseek(fp, skip, SEEK_CUR);

	for(done=0; done<size;)
	{
		if(size-done<sizeof(buf))
			i = fread(buf, 1, size-done, fp);
		else
			i = fread(buf, 1, 1024, fp);
		if(i<=0)
			break;
		done += i;
		dump(buf, i, buf);
	}

	return 0;
}
