/*
 ***************************************************************************
 * Ralink Tech Inc.
 * 4F, No. 2 Technology 5th Rd.
 * Science-based Industrial Park
 * Hsin-chu, Taiwan, R.O.C.
 *
 * (c) Copyright, Ralink Technology, Inc.
 *
 * All rights reserved. Ralink's source code is an unpublished work and the
 * use of a copyright notice does not imply otherwise. This source code
 * contains confidential trade secret material of Ralink Tech. Any attemp
 * or participation in deciphering, decoding, reverse engineering or in any
 * way altering the source code is stricitly prohibited, unless the prior
 * written consent of Ralink Technology, Inc. is obtained.
 ***************************************************************************
 *
 * $Id: //WIFI_SOC/MP/SDK_4_2_0_0/RT288x_SDK/source/user/rt2880_app/gpio/gpio.c#1 $
 */

#include <stdio.h>             
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <fcntl.h>
#include <signal.h>
#include <sys/ioctl.h>
#include <linux/autoconf.h>
#include "ralink_gpio.h"

#define GPIO_DEV	"/dev/gpio"

enum {
	gpio_in,
	gpio_out,
};
enum {
#if defined (CONFIG_RALINK_RT3052)
	gpio2300,
	gpio3924,
	gpio5140,
#elif defined (CONFIG_RALINK_RT3883)
	gpio2300,
	gpio3924,
	gpio7140,
	gpio9572,
#elif defined (CONFIG_RALINK_RT3352)
	gpio2300,
	gpio3924,
	gpio4540,
#elif defined (CONFIG_RALINK_RT5350)
	gpio2100,
	gpio2722,
#elif defined (CONFIG_RALINK_RT6855A)
	gpio1500,
	gpio3116,
#elif defined (CONFIG_RALINK_MT7620)
	gpio2300,
	gpio3924,
	gpio7140,
	gpio72,
#elif defined (CONFIG_RALINK_MT7621)
	gpio3100,
	gpio6332,
	gpio9564,
#elif defined (CONFIG_RALINK_MT7628)
	gpio2300,
	gpio3924,
	gpio7140,
	gpio72,
#else
	gpio2300,
#endif
};

int gpio_set_dir(int r, int dir)
{
	int fd, req;

	fd = open(GPIO_DEV, O_RDONLY);
	if (fd < 0) {
		perror(GPIO_DEV);
		return -1;
	}
	if (dir == gpio_in) {
#if defined (CONFIG_RALINK_RT3052)
		if (r == gpio5140)
			req = RALINK_GPIO5140_SET_DIR_IN;
		else if (r == gpio3924)
			req = RALINK_GPIO3924_SET_DIR_IN;
		else
#elif defined (CONFIG_RALINK_RT3883)
		if (r == gpio9572)
			req = RALINK_GPIO9572_SET_DIR_IN;
		else if (r == gpio7140)
			req = RALINK_GPIO7140_SET_DIR_IN;
		else if (r == gpio3924)
			req = RALINK_GPIO3924_SET_DIR_IN;
		else
#elif defined (CONFIG_RALINK_RT3352)
		if (r == gpio4540)
			req = RALINK_GPIO4540_SET_DIR_IN;
		else if (r == gpio3924)
			req = RALINK_GPIO3924_SET_DIR_IN;
		else
#elif defined (CONFIG_RALINK_RT5350)
		if (r == gpio2722)
			req = RALINK_GPIO2722_SET_DIR_IN;
		else
#elif defined (CONFIG_RALINK_RT6855A)
		if (r == gpio3116)
			req = RALINK_GPIO3116_SET_DIR_IN;
		else
#elif defined (CONFIG_RALINK_MT7620)
		if (r == gpio72)
			req = RALINK_GPIO72_SET_DIR_IN;
		else if (r == gpio7140)
			req = RALINK_GPIO7140_SET_DIR_IN;
		else if (r == gpio3924)
			req = RALINK_GPIO3924_SET_DIR_IN;
		else
#elif defined (CONFIG_RALINK_MT7621)
		if (r == gpio9564)
			req = RALINK_GPIO9564_SET_DIR_IN;
		else if (r == gpio6332)
			req = RALINK_GPIO6332_SET_DIR_IN;
		else
#elif defined (CONFIG_RALINK_MT7628)
		if (r == gpio72)
			req = RALINK_GPIO72_SET_DIR_IN;
		else if (r == gpio7140)
			req = RALINK_GPIO7140_SET_DIR_IN;
		else if (r == gpio3924)
			req = RALINK_GPIO3924_SET_DIR_IN;
		else
#endif
			req = RALINK_GPIO_SET_DIR_IN;
	}
	else {
#if defined (CONFIG_RALINK_RT3052)
		if (r == gpio5140)
			req = RALINK_GPIO5140_SET_DIR_OUT;
		else if (r == gpio3924)
			req = RALINK_GPIO3924_SET_DIR_OUT;
		else
#elif defined (CONFIG_RALINK_RT3883)
		if (r == gpio9572)
			req = RALINK_GPIO9572_SET_DIR_OUT;
		else if (r == gpio7140)
			req = RALINK_GPIO7140_SET_DIR_OUT;
		else if (r == gpio3924)
			req = RALINK_GPIO3924_SET_DIR_OUT;
		else
#elif defined (CONFIG_RALINK_RT3352)
		if (r == gpio4540)
			req = RALINK_GPIO4540_SET_DIR_OUT;
		else if (r == gpio3924)
			req = RALINK_GPIO3924_SET_DIR_OUT;
		else
#elif defined (CONFIG_RALINK_RT5350)
		if (r == gpio2722)
			req = RALINK_GPIO2722_SET_DIR_OUT;
		else
#elif defined (CONFIG_RALINK_RT6855A)
		if (r == gpio3116)
			req = RALINK_GPIO3116_SET_DIR_OUT;
		else
#elif defined (CONFIG_RALINK_MT7620)
		if (r == gpio72)
			req = RALINK_GPIO72_SET_DIR_OUT;
		else if (r == gpio7140)
			req = RALINK_GPIO7140_SET_DIR_OUT;
		else if (r == gpio3924)
			req = RALINK_GPIO3924_SET_DIR_OUT;
		else
#elif defined (CONFIG_RALINK_MT7621)
		if (r == gpio9564)
			req = RALINK_GPIO9564_SET_DIR_OUT;
		else if (r == gpio6332)
			req = RALINK_GPIO6332_SET_DIR_OUT;
		else
#elif defined (CONFIG_RALINK_MT7628)
		if (r == gpio72)
			req = RALINK_GPIO72_SET_DIR_OUT;
		else if (r == gpio7140)
			req = RALINK_GPIO7140_SET_DIR_OUT;
		else if (r == gpio3924)
			req = RALINK_GPIO3924_SET_DIR_OUT;
		else
#endif
			req = RALINK_GPIO_SET_DIR_OUT;
	}
	if (ioctl(fd, req, 0xffffffff) < 0) {
		perror("ioctl");
		close(fd);
		return -1;
	}
	close(fd);
	return 0;
}

int gpio_read_int(int r, int *value)
{
	int fd, req;

	*value = 0;
	fd = open(GPIO_DEV, O_RDONLY);
	if (fd < 0) {
		perror(GPIO_DEV);
		return -1;
	}

#if defined (CONFIG_RALINK_RT3052)
	if (r == gpio5140)
		req = RALINK_GPIO5140_READ;
	else if (r == gpio3924)
		req = RALINK_GPIO3924_READ;
	else
#elif defined (CONFIG_RALINK_RT3883)
	if (r == gpio9572)
		req = RALINK_GPIO9572_READ;
	else if (r == gpio7140)
		req = RALINK_GPIO7140_READ;
	else if (r == gpio3924)
		req = RALINK_GPIO3924_READ;
	else
#elif defined (CONFIG_RALINK_RT3352)
	if (r == gpio4540)
		req = RALINK_GPIO4540_READ;
	else if (r == gpio3924)
		req = RALINK_GPIO3924_READ;
	else
#elif defined (CONFIG_RALINK_RT5350)
	if (r == gpio2722)
		req = RALINK_GPIO2722_READ;
	else
#elif defined (CONFIG_RALINK_MT7620)
	if (r == gpio72)
		req = RALINK_GPIO72_READ;
	else if (r == gpio7140)
		req = RALINK_GPIO7140_READ;
	else if (r == gpio3924)
		req = RALINK_GPIO3924_READ;
	else
#elif defined (CONFIG_RALINK_MT7621)
	if (r == gpio9564)
		req = RALINK_GPIO9564_READ;
	else if (r == gpio6332)
		req = RALINK_GPIO6332_READ;
	else
#elif defined (CONFIG_RALINK_MT7628)
	if (r == gpio72)
		req = RALINK_GPIO72_READ;
	else if (r == gpio7140)
		req = RALINK_GPIO7140_READ;
	else if (r == gpio3924)
		req = RALINK_GPIO3924_READ;
	else
#endif
		req = RALINK_GPIO_READ;
	if (ioctl(fd, req, value) < 0) {
		perror("ioctl");
		close(fd);
		return -1;
	}
	close(fd);
	return 0;
}

int gpio_write_int(int r, int value)
{
	int fd, req;

	fd = open(GPIO_DEV, O_RDONLY);
	if (fd < 0) {
		perror(GPIO_DEV);
		return -1;
	}
#if defined (CONFIG_RALINK_RT3052)
	if (r == gpio5140)
		req = RALINK_GPIO5140_WRITE;
	else if (r == gpio3924)
		req = RALINK_GPIO3924_WRITE;
	else
#elif defined (CONFIG_RALINK_RT3883)
	if (r == gpio9572)
		req = RALINK_GPIO9572_WRITE;
	else if (r == gpio7140)
		req = RALINK_GPIO7140_WRITE;
	else if (r == gpio3924)
		req = RALINK_GPIO3924_WRITE;
	else
#elif defined (CONFIG_RALINK_RT3352)
	if (r == gpio4540)
		req = RALINK_GPIO4540_WRITE;
	else if (r == gpio3924)
		req = RALINK_GPIO3924_WRITE;
	else
#elif defined (CONFIG_RALINK_RT5350)
	if (r == gpio2722)
		req = RALINK_GPIO2722_WRITE;
	else
#elif defined (CONFIG_RALINK_MT7620)
	if (r == gpio72)
		req = RALINK_GPIO72_WRITE;
	else if (r == gpio7140)
		req = RALINK_GPIO7140_WRITE;
	else if (r == gpio3924)
		req = RALINK_GPIO3924_WRITE;
	else
#elif defined (CONFIG_RALINK_MT7621)
	if (r == gpio9564)
		req = RALINK_GPIO9564_WRITE;
	else if (r == gpio6332)
		req = RALINK_GPIO6332_WRITE;
	else
#elif defined (CONFIG_RALINK_MT7628)
	if (r == gpio72)
		req = RALINK_GPIO72_WRITE;
	else if (r == gpio7140)
		req = RALINK_GPIO7140_WRITE;
	else if (r == gpio3924)
		req = RALINK_GPIO3924_WRITE;
	else
#endif
		req = RALINK_GPIO_WRITE;
	if (ioctl(fd, req, value) < 0) {
		perror("ioctl");
		close(fd);
		return -1;
	}
	close(fd);
	return 0;
}

int gpio_enb_irq(void)
{
	int fd;

	fd = open(GPIO_DEV, O_RDONLY);
	if (fd < 0) {
		perror(GPIO_DEV);
		return -1;
	}
	if (ioctl(fd, RALINK_GPIO_ENABLE_INTP) < 0) {
		perror("ioctl");
		close(fd);
		return -1;
	}
	close(fd);
	return 0;
}

int gpio_dis_irq(void)
{
	int fd;

	fd = open(GPIO_DEV, O_RDONLY);
	if (fd < 0) {
		perror(GPIO_DEV);
		return -1;
	}
	if (ioctl(fd, RALINK_GPIO_DISABLE_INTP) < 0) {
		perror("ioctl");
		close(fd);
		return -1;
	}
	close(fd);
	return 0;
}

int gpio_reg_info(int gpio_num)
{
	int fd;
	ralink_gpio_reg_info info;

	fd = open(GPIO_DEV, O_RDONLY);
	if (fd < 0) {
		perror(GPIO_DEV);
		return -1;
	}
	info.pid = getpid();
	info.irq = gpio_num;
	if (ioctl(fd, RALINK_GPIO_REG_IRQ, &info) < 0) {
		perror("ioctl");
		close(fd);
		return -1;
	}
	close(fd);
	return 0;
}

void gpio_test_write(void)
{
	int i = 0;

	//set gpio direction to output
#if defined (CONFIG_RALINK_RT3052)
	gpio_set_dir(gpio5140, gpio_out);
	gpio_set_dir(gpio3924, gpio_out);
	gpio_set_dir(gpio2300, gpio_out);
#elif defined (CONFIG_RALINK_RT3883)
	gpio_set_dir(gpio9572, gpio_out);
	gpio_set_dir(gpio7140, gpio_out);
	gpio_set_dir(gpio3924, gpio_out);
	gpio_set_dir(gpio2300, gpio_out);
#elif defined (CONFIG_RALINK_RT3352)
	gpio_set_dir(gpio4540, gpio_out);
	gpio_set_dir(gpio3924, gpio_out);
	gpio_set_dir(gpio2300, gpio_out);
#elif defined (CONFIG_RALINK_RT5350)
	gpio_set_dir(gpio2722, gpio_out);
	gpio_set_dir(gpio2100, gpio_out);
#elif defined (CONFIG_RALINK_RT6855A)
	gpio_set_dir(gpio3116, gpio_out);
	gpio_set_dir(gpio1500, gpio_out);
#elif defined (CONFIG_RALINK_MT7620)
	gpio_set_dir(gpio72, gpio_out);
	gpio_set_dir(gpio7140, gpio_out);
	gpio_set_dir(gpio3924, gpio_out);
	gpio_set_dir(gpio2300, gpio_out);
#elif defined (CONFIG_RALINK_MT7621)
	gpio_set_dir(gpio9564, gpio_out);
	gpio_set_dir(gpio6332, gpio_out);
	gpio_set_dir(gpio3100, gpio_out);
#elif defined (CONFIG_RALINK_MT7628)
	gpio_set_dir(gpio72, gpio_out);
	gpio_set_dir(gpio7140, gpio_out);
	gpio_set_dir(gpio3924, gpio_out);
	gpio_set_dir(gpio2300, gpio_out);
#else
	gpio_set_dir(gpio2300, gpio_out);
#endif

	//turn off LEDs
#if defined (CONFIG_RALINK_RT3052)
	gpio_write_int(gpio5140, 0xffffffff);
	gpio_write_int(gpio3924, 0xffffffff);
	gpio_write_int(gpio2300, 0xffffffff);
#elif defined (CONFIG_RALINK_RT3883)
	gpio_write_int(gpio9572, 0xffffffff);
	gpio_write_int(gpio7140, 0xffffffff);
	gpio_write_int(gpio3924, 0xffffffff);
	gpio_write_int(gpio2300, 0xffffffff);
#elif defined (CONFIG_RALINK_RT3352)
	gpio_write_int(gpio4540, 0xffffffff);
	gpio_write_int(gpio3924, 0xffffffff);
	gpio_write_int(gpio2300, 0xffffffff);
#elif defined (CONFIG_RALINK_RT5350)
	gpio_write_int(gpio2722, 0xffffffff);
	gpio_write_int(gpio2100, 0xffffffff);
#elif defined (CONFIG_RALINK_RT6855A)
	gpio_write_int(gpio3116, 0x0000ffff);
	gpio_write_int(gpio1500, 0xffff0000);
#elif defined (CONFIG_RALINK_MT7620)
	gpio_write_int(gpio72, 0xffffffff);
	gpio_write_int(gpio7140, 0xffffffff);
	gpio_write_int(gpio3924, 0xffffffff);
	gpio_write_int(gpio2300, 0xffffffff);
#elif defined (CONFIG_RALINK_MT7621)
	gpio_write_int(gpio9564, 0xffffffff);
	gpio_write_int(gpio6332, 0xffffffff);
	gpio_write_int(gpio3100, 0xffffffff);
#elif defined (CONFIG_RALINK_MT7628)
	gpio_write_int(gpio72, 0xffffffff);
	gpio_write_int(gpio7140, 0xffffffff);
	gpio_write_int(gpio3924, 0xffffffff);
	gpio_write_int(gpio2300, 0xffffffff);
#else
	gpio_write_int(gpio2300, 0xffffffff);
#endif
	sleep(3);

	//turn on all LEDs
#if defined (CONFIG_RALINK_RT3052)
	gpio_write_int(gpio5140, 0);
	gpio_write_int(gpio3924, 0);
	gpio_write_int(gpio2300, 0);
#elif defined (CONFIG_RALINK_RT3883)
	gpio_write_int(gpio9572, 0);
	gpio_write_int(gpio7140, 0);
	gpio_write_int(gpio3924, 0);
	gpio_write_int(gpio2300, 0);
#elif defined (RALINK_GPIO_HAS_3352)
	gpio_write_int(gpio4540, 0);
	gpio_write_int(gpio3924, 0);
	gpio_write_int(gpio2300, 0);
#elif defined (CONFIG_RALINK_RT5350)
	gpio_write_int(gpio2722, 0);
	gpio_write_int(gpio2100, 0);
#elif defined (CONFIG_RALINK_RT6855A)
	gpio_write_int(gpio3116, 0);
	gpio_write_int(gpio1500, 0);
#elif defined (CONFIG_RALINK_MT7620)
	gpio_write_int(gpio72, 0);
	gpio_write_int(gpio7140, 0);
	gpio_write_int(gpio3924, 0);
	gpio_write_int(gpio2300, 0);
#elif defined (CONFIG_RALINK_MT7621)
	gpio_write_int(gpio9564, 0);
	gpio_write_int(gpio6332, 0);
	gpio_write_int(gpio3100, 0);
#elif defined (CONFIG_RALINK_MT7628)
	gpio_write_int(gpio72, 0);
	gpio_write_int(gpio7140, 0);
	gpio_write_int(gpio3924, 0);
	gpio_write_int(gpio2300, 0);
#else
	gpio_write_int(gpio2300, 0);
#endif
}

void gpio_test_read(void)
{
	int i, d;

#if defined (CONFIG_RALINK_RT3052)
	gpio_set_dir(gpio5140, gpio_in);
	gpio_read_int(gpio5140, &d);
	printf("gpio 51~40 = 0x%x\n", d);

	gpio_set_dir(gpio3924, gpio_in);
	gpio_read_int(gpio3924, &d);
	printf("gpio 39~24 = 0x%x\n", d);

	gpio_set_dir(gpio2300, gpio_in);
	gpio_read_int(gpio2300, &d);
	printf("gpio 23~00 = 0x%x\n", d);
#elif defined (CONFIG_RALINK_RT3883)
	gpio_set_dir(gpio9572, gpio_in);
	gpio_read_int(gpio9572, &d);
	printf("gpio 95~72 = 0x%x\n", d);

	gpio_set_dir(gpio7140, gpio_in);
	gpio_read_int(gpio7140, &d);
	printf("gpio 71~40 = 0x%x\n", d);

	gpio_set_dir(gpio3924, gpio_in);
	gpio_read_int(gpio3924, &d);
	printf("gpio 39~24 = 0x%x\n", d);

	gpio_set_dir(gpio2300, gpio_in);
	gpio_read_int(gpio2300, &d);
	printf("gpio 23~00 = 0x%x\n", d);
#elif defined (CONFIG_RALINK_RT3352)
	gpio_set_dir(gpio4540, gpio_in);
	gpio_read_int(gpio4540, &d);
	printf("gpio 45~40 = 0x%x\n", d);

	gpio_set_dir(gpio3924, gpio_in);
	gpio_read_int(gpio3924, &d);
	printf("gpio 39~24 = 0x%x\n", d);

	gpio_set_dir(gpio2300, gpio_in);
	gpio_read_int(gpio2300, &d);
	printf("gpio 23~00 = 0x%x\n", d);
#elif defined (CONFIG_RALINK_RT5350)
	gpio_set_dir(gpio2722, gpio_in);
	gpio_read_int(gpio2722, &d);
	printf("gpio 27~22 = 0x%x\n", d);

	gpio_set_dir(gpio2100, gpio_in);
	gpio_read_int(gpio2100, &d);
	printf("gpio 21~00 = 0x%x\n", d);
#elif defined (CONFIG_RALINK_RT6855A)
	gpio_set_dir(gpio3116, gpio_in);
	gpio_read_int(gpio3116, &d);
	printf("gpio 31~16 = 0x%x\n", d);

	gpio_set_dir(gpio1500, gpio_in);
	gpio_read_int(gpio1500, &d);
	printf("gpio 15~00 = 0x%x\n", d);
#elif defined (CONFIG_RALINK_MT7620)
	gpio_set_dir(gpio72, gpio_in);
	gpio_read_int(gpio72, &d);
	printf("gpio 72 = 0x%x\n", d);

	gpio_set_dir(gpio7140, gpio_in);
	gpio_read_int(gpio7140, &d);
	printf("gpio 71~40 = 0x%x\n", d);

	gpio_set_dir(gpio3924, gpio_in);
	gpio_read_int(gpio3924, &d);
	printf("gpio 39~24 = 0x%x\n", d);

	gpio_set_dir(gpio2300, gpio_in);
	gpio_read_int(gpio2300, &d);
	printf("gpio 23~00 = 0x%x\n", d);
#elif defined (CONFIG_RALINK_MT7621)
	gpio_set_dir(gpio9564, gpio_in);
	gpio_read_int(gpio9564, &d);
	printf("gpio 95~64 = 0x%x\n", d);

	gpio_set_dir(gpio6332, gpio_in);
	gpio_read_int(gpio6332, &d);
	printf("gpio 63~32 = 0x%x\n", d);
	
	gpio_set_dir(gpio3100, gpio_in);
	gpio_read_int(gpio3100, &d);
	printf("gpio 31~00 = 0x%x\n", d);
#elif defined (CONFIG_RALINK_MT7628)
	gpio_set_dir(gpio72, gpio_in);
	gpio_read_int(gpio72, &d);
	printf("gpio 72 = 0x%x\n", d);

	gpio_set_dir(gpio7140, gpio_in);
	gpio_read_int(gpio7140, &d);
	printf("gpio 71~40 = 0x%x\n", d);

	gpio_set_dir(gpio3924, gpio_in);
	gpio_read_int(gpio3924, &d);
	printf("gpio 39~24 = 0x%x\n", d);

	gpio_set_dir(gpio2300, gpio_in);
	gpio_read_int(gpio2300, &d);
	printf("gpio 23~00 = 0x%x\n", d);
#else
	gpio_set_dir(gpio2300, gpio_in);
	gpio_read_int(gpio2300, &d);
	printf("gpio 23~00 = 0x%x\n", d);
#endif
}

void signal_handler(int signum)
{
	printf("gpio tester: signal ");
	if (signum == SIGUSR1)
		printf("SIGUSR1");
	else if (signum == SIGUSR2)
		printf("SIGUSR2");
	else
		printf("%d", signum);
	printf(" received\n", signum);
}

void gpio_test_intr(int gpio_num)
{
	//set gpio direction to input
#if defined (CONFIG_RALINK_RT3052)
	gpio_set_dir(gpio5140, gpio_in);
	gpio_set_dir(gpio3924, gpio_in);
	gpio_set_dir(gpio2300, gpio_in);
#elif defined (CONFIG_RALINK_RT3352)
	gpio_set_dir(gpio4540, gpio_in);
	gpio_set_dir(gpio3924, gpio_in);
	gpio_set_dir(gpio2300, gpio_in);
#elif defined (CONFIG_RALINK_RT3883)
	gpio_set_dir(gpio9572, gpio_in);
	gpio_set_dir(gpio7140, gpio_in);
	gpio_set_dir(gpio3924, gpio_in);
	gpio_set_dir(gpio2300, gpio_in);
#elif defined (CONFIG_RALINK_RT5350)
	gpio_set_dir(gpio2722, gpio_in);
	gpio_set_dir(gpio2100, gpio_in);
#elif defined (CONFIG_RALINK_RT6855A)
	gpio_set_dir(gpio3116, gpio_in);
	gpio_set_dir(gpio1500, gpio_in);
#elif defined (CONFIG_RALINK_MT7620)
	gpio_set_dir(gpio72, gpio_in);
	gpio_set_dir(gpio7140, gpio_in);
	gpio_set_dir(gpio3924, gpio_in);
	gpio_set_dir(gpio2300, gpio_in);
#elif defined (CONFIG_RALINK_MT7621)
	gpio_set_dir(gpio9564, gpio_in);
	gpio_set_dir(gpio6332, gpio_in);
	gpio_set_dir(gpio3100, gpio_in);
#elif defined (CONFIG_RALINK_MT7628)
	gpio_set_dir(gpio72, gpio_in);
	gpio_set_dir(gpio7140, gpio_in);
	gpio_set_dir(gpio3924, gpio_in);
	gpio_set_dir(gpio2300, gpio_in);
#else
	gpio_set_dir(gpio2300, gpio_in);
#endif

	//enable gpio interrupt
	gpio_enb_irq();

	//register my information
	gpio_reg_info(gpio_num);

	//issue a handler to handle SIGUSR1
	signal(SIGUSR1, signal_handler);
	signal(SIGUSR2, signal_handler);

	//wait for signal
	pause();

	//disable gpio interrupt
	gpio_dis_irq();
}

void gpio_set_led(int argc, char *argv[])
{
	int fd;
	ralink_gpio_led_info led;

	led.gpio = atoi(argv[2]);
	if (led.gpio < 0 || led.gpio >= RALINK_GPIO_NUMBER) {
		printf("gpio number %d out of range (should be 0 ~ %d)\n", led.gpio, RALINK_GPIO_NUMBER);
		return;
	}
	led.on = (unsigned int)atoi(argv[3]);
	if (led.on > RALINK_GPIO_LED_INFINITY) {
		printf("on interval %d out of range (should be 0 ~ %d)\n", led.on, RALINK_GPIO_LED_INFINITY);
		return;
	}
	led.off = (unsigned int)atoi(argv[4]);
	if (led.off > RALINK_GPIO_LED_INFINITY) {
		printf("off interval %d out of range (should be 0 ~ %d)\n", led.off, RALINK_GPIO_LED_INFINITY);
		return;
	}
	led.blinks = (unsigned int)atoi(argv[5]);
	if (led.blinks > RALINK_GPIO_LED_INFINITY) {
		printf("number of blinking cycles %d out of range (should be 0 ~ %d)\n", led.blinks, RALINK_GPIO_LED_INFINITY);
		return;
	}
	led.rests = (unsigned int)atoi(argv[6]);
	if (led.rests > RALINK_GPIO_LED_INFINITY) {
		printf("number of resting cycles %d out of range (should be 0 ~ %d)\n", led.rests, RALINK_GPIO_LED_INFINITY);
		return;
	}
	led.times = (unsigned int)atoi(argv[7]);
	if (led.times > RALINK_GPIO_LED_INFINITY) {
		printf("times of blinking %d out of range (should be 0 ~ %d)\n", led.times, RALINK_GPIO_LED_INFINITY);
		return;
	}

	fd = open(GPIO_DEV, O_RDONLY);
	if (fd < 0) {
		perror(GPIO_DEV);
		return;
	}
	if (ioctl(fd, RALINK_GPIO_LED_SET, &led) < 0) {
		perror("ioctl");
		close(fd);
		return;
	}
	close(fd);
}

void usage(char *cmd)
{
	printf("Usage: %s w - writing test (output)\n", cmd);
	printf("       %s r - reading test (input)\n", cmd);
	printf("       %s i (<gpio>) - interrupt test for gpio number\n", cmd);
	printf("       %s l <gpio> <on> <off> <blinks> <rests> <times>\n", cmd);
	printf("            - set led on <gpio>(0~24) on/off interval, no. of blinking/resting cycles, times of blinking\n");
	exit(0);
}

int main(int argc, char *argv[])
{
	char driver[32]={0};
	char devnum[32]={0};
	char cmd[64] = {0};
	FILE * fp = NULL;

	fp = popen("cat /proc/devices | grep gpio | sed  -r -n \"s/[0-9]+ //p\"", "r");
	fscanf(fp, "%s", driver);
	pclose(fp);

	fp = popen("cat /proc/devices | grep gpio | sed  -r -n \"s/ [0-9a-z]+//p\"", "r");
	fscanf(fp, "%s", devnum);
	pclose(fp);

	if (strlen(driver) && strlen(devnum))
	{
		snprintf(cmd, sizeof(cmd), "[ ! -f /dev/gpio ] && mknod /dev/gpio c %d 0", atoi(devnum));
		system(cmd);
	}
	else
	{
		printf("GPIO module not enabled!\n");
	}

	if (argc < 2)
		usage(argv[0]);

	switch (argv[1][0]) {
	case 'w':
		gpio_test_write();
		break;
	case 'r':
		gpio_test_read();
		break;
	case 'i':
		if (argc == 3)
			gpio_test_intr(atoi(argv[2]));
		else
			gpio_test_intr(0);
		break;
	case 'l':
		if (argc != 8)
			usage(argv[0]);
		gpio_set_led(argc, argv);
		break;
	default:
		usage(argv[0]);
	}

	return 0;
}

