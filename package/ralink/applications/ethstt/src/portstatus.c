#include <fcntl.h>
#include <stdio.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/ioctl.h>
#include <sys/socket.h>
#include <signal.h>
#include <linux/if.h>
#include <linux/mii.h>
#include <linux/autoconf.h>

#include <ra_ioctl.h>


int esw_fd;

void switch_init(void)
{
	esw_fd = socket(AF_INET, SOCK_DGRAM, 0);
	if (esw_fd < 0) {
		perror("socket");
		exit(0);
	}
}

void switch_fini(void)
{
	close(esw_fd);
}

int port_status(int port, int reg){
	int sk, opt, ret;
	int result;
	struct ifreq ifr;
	int method;

	ra_mii_ioctl_data mii;
	sk = socket(AF_INET, SOCK_DGRAM, 0);
	if (sk < 0) {
		printf("Open socket failed\n");
		return -1;
	}
	strncpy(ifr.ifr_name, "eth0", 5);
	ifr.ifr_data = &mii;

	mii.phy_id=port; //port
	mii.reg_num=reg; //reg
	method = RAETH_MII_READ;
	ret = ioctl(sk, method, &ifr);
	if (ret < 0) {
		printf("mii_mgr: ioctl error\n");
	}	
	result = mii.val_out;
	result = ((result&0x04) >>2);
	return result;

}

void signal_handler(int signum)
{
	int port0, port1, port2, port3, port4, port5;
	if (signum == SIGUSR2){
		//printf("SIG2\n");
	}else{
		//printf("SIG1\n");
		port0 = port_status(0, 1);
		port1 = port_status(1, 1);
		port2 = port_status(2, 1);
		port3 = port_status(3, 1);
		port4 = port_status(4, 1);
		port5 = port_status(5, 1);

		if (port0==1){
			printf("port 0 up\n");
		}else if(port0 == 0){
			printf("port 0 down\n");
		}
		if(port1 == 1){
			printf("port 1 up\n");
		}else if(port1 == 0){
			printf("port 1 down\n");
		}
		if(port2 == 1){
			printf("port 2 up\n");
		}else if(port2 == 0){
			printf("port 2 down\n");
		}
		if(port3 == 1){
			printf("port 3 up\n");
		}else if(port3 == 0){
			printf("port 3 down\n");
		}
		if(port4 == 1){
			printf("port 4 up\n");
		}else if(port4 == 0){
			printf("port 4 down\n");
		}
		if(port5 == 1){
			printf("port 5 up\n");
		}else if(port5 == 0){
			printf("port 5 down\n");
		}


	}
}

int esw_reg_info(void)
{
	ralink_esw_reg_info info;
	struct ifreq ifr;
	strncpy(ifr.ifr_name, "eth0", 5);
	info.pid = getpid();
	ifr.ifr_data = &info;
	if (-1 == ioctl(esw_fd, RAETH_ESW_GET_PID,  &ifr)) {
		perror("ioctl");
		close(esw_fd);
		exit(0);
	}

	return 0;
}

static void esw_config(void)
{

	esw_reg_info();
	//issue a handler to handle SIGUSR1
	signal(SIGUSR1, signal_handler);
	signal(SIGUSR2, signal_handler);
	while(1){
		//wait for signal
		//printf("waite pause\n");
		pause();
	}

}



int main(int argc, char *argv[])
{
	int sk;
	switch_init();

	// daemon mode

	if(argc>1 && 0 == strcmp(argv[1],"-d"))
		esw_config();
	else
		signal_handler(1);

	return 0;
}
