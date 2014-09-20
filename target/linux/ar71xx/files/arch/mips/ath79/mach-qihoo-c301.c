/*
 *  Qihoo 360 C301 board support by 981213
 *  Based on WD My Net N600 board support
 *
 *  Copyright (C) 2013 Gabor Juhos <juhosg@openwrt.org>
 *
 *  This program is free software; you can redistribute it and/or modify it
 *  under the terms of the GNU General Public License version 2 as published
 *  by the Free Software Foundation.
 */

#include <linux/pci.h>
#include <linux/phy.h>
#include <linux/gpio.h>
#include <linux/platform_device.h>
#include <linux/ath9k_platform.h>
#include <linux/ar8216_platform.h>
#include <linux/crc32.h>
#include <linux/mtd/mtd.h>

#include <asm/mach-ath79/ar71xx_regs.h>

#include "common.h"
#include "dev-ap9x-pci.h"
#include "dev-eth.h"
#include "dev-gpio-buttons.h"
#include "dev-leds-gpio.h"
#include "dev-m25p80.h"
#include "dev-spi.h"
#include "dev-usb.h"
#include "dev-wmac.h"
#include "machtypes.h"
#include "nvram.h"
#include "pci.h"

#define QIHOO_C301_GPIO_LED_GREEN_STATUS	0
#define QIHOO_C301_GPIO_LED_RED_STATUS		11
#define QIHOO_C301_GPIO_LED_ETH_LIGHT		18
#define QIHOO_C301_GPIO_USB_POWER		19

#define QIHOO_C301_GPIO_LED_INTERNET	1

#define QIHOO_C301_GPIO_LED_LAN1	2
#define QIHOO_C301_GPIO_LED_LAN2	3

#define QIHOO_C301_GPIO_BTN_RESET	16

#define QIHOO_C301_GPIO_SPI_CS1		12

#define QIHOO_C301_GPIO_EXTERNAL_LNA0	14
#define QIHOO_C301_GPIO_EXTERNAL_LNA1	15

#define QIHOO_C301_KEYS_POLL_INTERVAL	20	/* msecs */
#define QIHOO_C301_KEYS_DEBOUNCE_INTERVAL (3 * QIHOO_C301_KEYS_POLL_INTERVAL)

#define QIHOO_C301_MAC0_OFFSET		0
#define QIHOO_C301_MAC1_OFFSET		6
#define QIHOO_C301_WMAC_CALDATA_OFFSET	0x1000

#define QIHOO_C301_NVRAM_ADDR		0x1f058010
#define QIHOO_C301_NVRAM_SIZE		0x7ff0
static struct gpio_led qihoo_c301_leds_gpio[] __initdata = {
		{
		.name		= "360:green:status",
		.gpio		= QIHOO_C301_GPIO_LED_GREEN_STATUS,
		.active_low	= 1,
	},{
		.name		= "360:red:status",
		.gpio		= QIHOO_C301_GPIO_LED_RED_STATUS,
		.active_low	= 1,
	},{
		.name		= "360:green:ethsw",   //这个是所有接口LED指示灯的总开关
		.gpio		= QIHOO_C301_GPIO_LED_ETH_LIGHT,
		.active_low	= 1,
	},
};

static struct gpio_keys_button qihoo_c301_gpio_keys[] __initdata = {
	{
		.desc		= "Reset button",
		.type		= EV_KEY,
		.code		= KEY_RESTART,
		.debounce_interval = QIHOO_C301_KEYS_DEBOUNCE_INTERVAL,
		.gpio		= QIHOO_C301_GPIO_BTN_RESET,
		.active_low	= 1,
	},
};
static int qihoo_c301_board=0;
static void qihoo_c301_get_mac(const char *name, char *mac)
{
	u8 *nvram = (u8 *) KSEG1ADDR(QIHOO_C301_NVRAM_ADDR);
	int err;

	err = ath79_nvram_parse_mac_addr(nvram, QIHOO_C301_NVRAM_SIZE,
					 name, mac);
	if (err)
		pr_err("no MAC address found for %s\n", name);
}

#define QIHOO_C301_WAN_PHY_MASK	BIT(0)

static void __init qihoo_c301_setup(void)
{
	u8 *art = (u8 *) KSEG1ADDR(0x1fff0000);
	u8 tmpmac[ETH_ALEN];

	ath79_gpio_output_select(QIHOO_C301_GPIO_SPI_CS1,
                             AR934X_GPIO_OUT_SPI_CS1);
	ath79_register_m25p80_multi(NULL);
    qihoo_c301_board=1;
    ath79_gpio_function_enable(AR934X_GPIO_FUNC_JTAG_DISABLE);

	ath79_gpio_output_select(QIHOO_C301_GPIO_LED_LAN1,
				 AR934X_GPIO_OUT_LED_LINK1);
	ath79_gpio_output_select(QIHOO_C301_GPIO_LED_LAN2,
				 AR934X_GPIO_OUT_LED_LINK2);
	ath79_gpio_output_select(QIHOO_C301_GPIO_LED_INTERNET,
				 AR934X_GPIO_OUT_LED_LINK4);
	ath79_register_leds_gpio(-1, ARRAY_SIZE(qihoo_c301_leds_gpio),
				 qihoo_c301_leds_gpio);

	ath79_register_gpio_keys_polled(-1, QIHOO_C301_KEYS_POLL_INTERVAL,
					ARRAY_SIZE(qihoo_c301_gpio_keys),
					qihoo_c301_gpio_keys);

	/*
	 * Control signal for external LNAs 0 and 1
	 * Taken from GPL bootloader source:
	 *   board/ar7240/db12x/alpha_gpio.c
	 */
	ath79_wmac_set_ext_lna_gpio(0, QIHOO_C301_GPIO_EXTERNAL_LNA0);
	ath79_wmac_set_ext_lna_gpio(1, QIHOO_C301_GPIO_EXTERNAL_LNA1);

	qihoo_c301_get_mac("wlan24mac=", tmpmac);
	ath79_register_wmac(art + QIHOO_C301_WMAC_CALDATA_OFFSET, tmpmac);

	ath79_register_pci();

	ath79_setup_ar934x_eth_cfg(AR934X_ETH_CFG_SW_ONLY_MODE |
				   AR934X_ETH_CFG_SW_PHY_SWAP);

	ath79_register_mdio(1, 0x0);

	/* LAN */
	qihoo_c301_get_mac("lanmac=", ath79_eth1_data.mac_addr);

	/* GMAC1 is connected to the internal switch */
	ath79_eth1_data.phy_if_mode = PHY_INTERFACE_MODE_GMII;

	ath79_register_eth(1);

	/* WAN */
	qihoo_c301_get_mac("wanmac=", ath79_eth0_data.mac_addr);

	/* GMAC0 is connected to the PHY4 of the internal switch */
	ath79_switch_data.phy4_mii_en = 1;
	ath79_switch_data.phy_poll_mask = QIHOO_C301_WAN_PHY_MASK;

	ath79_eth0_data.phy_if_mode = PHY_INTERFACE_MODE_MII;
	ath79_eth0_data.phy_mask = QIHOO_C301_WAN_PHY_MASK;
	ath79_eth0_data.mii_bus_dev = &ath79_mdio1_device.dev;

	ath79_register_eth(0);
	/* enable power for the USB port */
	gpio_request_one(QIHOO_C301_GPIO_USB_POWER,
			 GPIOF_OUT_INIT_HIGH | GPIOF_EXPORT_DIR_FIXED,
			 "USB power");
	ath79_register_usb();
}

MIPS_MACHINE(ATH79_MACH_QIHOO_C301, "QIHOO-C301", "Qihoo 360 C301",
	     qihoo_c301_setup);

//the following code stops qihoo's uboot booting into the backup system.
static void erase_callback(struct erase_info *erase)
{
	char * buf = (char*) erase->priv;
	int ret;
	size_t nb=0;

	if (erase->state == MTD_ERASE_DONE)
	{
		ret = mtd_write(erase->mtd, 0, 0x10000, &nb, buf);
	}
	kfree(erase);
	kfree(buf);
}

static int qihoo_reset_trynum(void)
{
	size_t nb = 0;
	char *buf=0, *p;
	const char * match = "image1trynum=";
	size_t matchlen = strlen(match);
	struct erase_info *erase;
	struct mtd_info * mtd;
	unsigned int newcrc;
	int ret;

	if (! qihoo_c301_board)
		return 0;

	mtd = get_mtd_device_nm("action_image_config");
	if (IS_ERR(mtd))
	{
		return PTR_ERR(mtd);
    }
	if (mtd->size!=0x10000)
	{
		return -1;
	}
	buf = kzalloc(0x10000+4, GFP_KERNEL);
	ret = mtd_read(mtd, 0, 0x10000, &nb, buf);
	if (nb != 0x10000)
	{
		kfree(buf);
		return -1;
	}
	for (p=buf+4; *p; p+=strlen(p)+1)
	{
		if (strncmp(p, match, matchlen)==0)
		{
			p += matchlen;
			while (*p)
				*p++ = '0';
			break;
		}
	}

	newcrc = crc32(~0, buf+4, 0xfffc)^0xffffffff;
	memcpy(buf, &newcrc, 4);

	erase = kzalloc(sizeof(struct erase_info), GFP_KERNEL);
	if (!erase)
	{
		kfree(buf);
		return -1;
	}
	erase->mtd      = mtd;
	erase->callback = erase_callback;
	erase->addr     = 0;
	erase->len      = 0x10000;
	erase->priv     = (u_long) buf;
	ret = mtd_erase(mtd, erase);

	if (ret) {
		kfree(buf);
		kfree(erase);
		return ret;
	}

	return 0;
}
late_initcall(qihoo_reset_trynum);
