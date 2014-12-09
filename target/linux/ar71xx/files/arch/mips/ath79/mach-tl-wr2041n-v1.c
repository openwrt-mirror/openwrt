/*
 *  TP-LINK TL-WR2041N v1 board support
 *
 *  Copyright (C) 2012 Gabor Juhos <juhosg@openwrt.org>
 *  Copyright (C) 2013 Gui Iribarren <gui@altermundi.net>
 *
 *  This program is free software; you can redistribute it and/or modify it
 *  under the terms of the GNU General Public License version 2 as published
 *  by the Free Software Foundation.
 * 
 *  TODO: leds: lan switch reversed, wan no problem, wlan always off
 * 
 */

#include <linux/pci.h>
#include <linux/phy.h>
#include <linux/gpio.h>
#include <linux/platform_device.h>
#include <linux/ath9k_platform.h>
#include <linux/ar8216_platform.h>

#include <asm/mach-ath79/ar71xx_regs.h>

#include "common.h"
#include "dev-ap9x-pci.h"
#include "dev-eth.h"
#include "dev-gpio-buttons.h"
#include "dev-leds-gpio.h"
#include "dev-m25p80.h"
#include "dev-spi.h"
#include "dev-wmac.h"
#include "machtypes.h"

#define WR2041N_GPIO_LED_WLAN		13     /* investigate */
#define WR2041N_GPIO_LED_SYSTEM		14     /* no problem */
#define WR2041N_GPIO_LED_QSS		15
#define WR2041N_GPIO_LED_WAN		18     /* no problem */
/* LAN led GPIO seems correct, based on ar9344 datasheet */
#define WR2041N_GPIO_LED_LAN4		19
#define WR2041N_GPIO_LED_LAN3		20
#define WR2041N_GPIO_LED_LAN2		21
#define WR2041N_GPIO_LED_LAN1		22
/* #define WR2041N_GPIO_LED_LAN4		12 */

#define WR2041N_GPIO_BTN_WPS		16
#define WR2041N_GPIO_BTN_RFKILL		17

#define WR2041N_KEYS_POLL_INTERVAL	20	/* msecs */
#define WR2041N_KEYS_DEBOUNCE_INTERVAL	(3 * WR2041N_KEYS_POLL_INTERVAL)

#define WR2041N_MAC0_OFFSET		0
#define WR2041N_MAC1_OFFSET		6
#define WR2041N_WMAC_CALDATA_OFFSET	0x0000
#define WR2041N_PCIE_CALDATA_OFFSET	0x4000

static const char *wr2041n_part_probes[] = {
	"tp-link",
	NULL,
};

static struct flash_platform_data wr2041n_flash_data = {
	.part_probes	= wr2041n_part_probes,
};

static struct gpio_led wr2041n_leds_gpio[] __initdata = {
	{
		.name		= "tp-link:green:qss",
		.gpio		= WR2041N_GPIO_LED_QSS,
		.active_low	= 1,
	},
	{
		.name		= "tp-link:green:system",
		.gpio		= WR2041N_GPIO_LED_SYSTEM,
		.active_low	= 1,
	},
        {
		.name		= "tp-link:green:wlan",
		.gpio		= WR2041N_GPIO_LED_WLAN,
		.active_low	= 1,
	},
        {
		.name		= "tp-link:green:lan1",
		.gpio		= WR2041N_GPIO_LED_LAN1,
		.active_low	= 1,
	},
        {
		.name		= "tp-link:green:lan2",
		.gpio		= WR2041N_GPIO_LED_LAN2,
		.active_low	= 1,
	},
        {
		.name		= "tp-link:green:lan3",
		.gpio		= WR2041N_GPIO_LED_LAN3,
		.active_low	= 1,
	},
        {
		.name		= "tp-link:green:lan4",
		.gpio		= WR2041N_GPIO_LED_LAN4,
		.active_low	= 1,
	},
};

static struct gpio_keys_button wr2041n_gpio_keys[] __initdata = {
	{
		.desc		= "QSS button",
		.type		= EV_KEY,
		.code		= KEY_WPS_BUTTON,
		.debounce_interval = WR2041N_KEYS_DEBOUNCE_INTERVAL,
		.gpio		= WR2041N_GPIO_BTN_WPS,
		.active_low	= 1,
	},
	{
		.desc		= "RFKILL switch",
		.type		= EV_SW,
		.code		= KEY_RFKILL,
		.debounce_interval = WR2041N_KEYS_DEBOUNCE_INTERVAL,
		.gpio		= WR2041N_GPIO_BTN_RFKILL,
	},
};

static void __init wr2041n_setup(void)
{
	u8 *mac = (u8 *) KSEG1ADDR(0x1f01fc00);
	u8 *art = (u8 *) KSEG1ADDR(0x1fff0000);
	u8 tmpmac[ETH_ALEN];

	ath79_register_m25p80(&wr2041n_flash_data);
	/*
	  seems that the built-in switch has a reversed link between
	  gpio and leds
	*/
	ath79_gpio_output_select(WR2041N_GPIO_LED_WAN,
				 AR934X_GPIO_OUT_LED_LINK4);
	ath79_gpio_output_select(WR2041N_GPIO_LED_LAN1,
				 AR934X_GPIO_OUT_LED_LINK3);
	ath79_gpio_output_select(WR2041N_GPIO_LED_LAN2,
				 AR934X_GPIO_OUT_LED_LINK2);
	ath79_gpio_output_select(WR2041N_GPIO_LED_LAN3,
				 AR934X_GPIO_OUT_LED_LINK1);
	ath79_gpio_output_select(WR2041N_GPIO_LED_LAN4,
				 AR934X_GPIO_OUT_LED_LINK0);

	ath79_register_leds_gpio(-1, ARRAY_SIZE(wr2041n_leds_gpio),
				 wr2041n_leds_gpio);
	ath79_register_gpio_keys_polled(-1, WR2041N_KEYS_POLL_INTERVAL,
					ARRAY_SIZE(wr2041n_gpio_keys),
					wr2041n_gpio_keys);

	ath79_init_mac(tmpmac, mac, 0);
	ath79_register_wmac(art + WR2041N_WMAC_CALDATA_OFFSET, tmpmac);

	ath79_init_mac(tmpmac, mac, 1);
	ap9x_pci_setup_wmac_led_pin(0, 0);
	ap91_pci_init(art + WR2041N_PCIE_CALDATA_OFFSET, tmpmac);

	//ath79_setup_ar934x_eth_cfg(AR934X_ETH_CFG_SW_ONLY_MODE);    //origin

	ath79_setup_ar934x_eth_cfg(AR934X_ETH_CFG_SW_PHY_SWAP);

	ath79_register_mdio(1, 0x0);

	/* LAN */
	ath79_init_mac(ath79_eth1_data.mac_addr, mac, -1);

	/* GMAC1 is connected to the internal switch */
	ath79_eth1_data.phy_if_mode = PHY_INTERFACE_MODE_GMII;

	ath79_register_eth(1);

	/* WAN */
	ath79_init_mac(ath79_eth0_data.mac_addr, mac, 2);

	/* GMAC0 is connected to the PHY4 of the internal switch */
	ath79_switch_data.phy4_mii_en = 1;
	ath79_switch_data.phy_poll_mask = BIT(0);  //BIT(4); //origin
	ath79_eth0_data.phy_if_mode = PHY_INTERFACE_MODE_MII;
	ath79_eth0_data.phy_mask = BIT(0);    //BIT(4);    //origin
	ath79_eth0_data.mii_bus_dev = &ath79_mdio1_device.dev;

	ath79_register_eth(0);

}

MIPS_MACHINE(ATH79_MACH_TL_WR2041N_V1, "TL-WR2041N-v1",
	     "TP-LINK TL-WR2041N v1",
	     wr2041n_setup);
