# All rights reserved.
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=mt7620
PKG_VERSION:=wifi2716_all_dpa_20130426

#PKG_SOURCE:=$(PKG_NAME)_$(PKG_VERSION).tar.bz2
PKG_BUILD_DIR:=$(KERNEL_BUILD_DIR)/$(PKG_NAME)_$(PKG_VERSION)
PKG_UNPACK=mkdir -p $(PKG_BUILD_DIR); $(CP) ./src/* $(PKG_BUILD_DIR)/

PKG_KCONFIG:=RALINK_MT7620 RALINK_RT5350 RALINK_3883 RALINK_RT3352 RT2860V2_AP_V24_DATA_STRUCTURE \
	RT2860V2_AP_WSC RT2860V2_AP_WSC_V2 RT2860V2_AP_LLTD RT2860V2_AP_WDS RT2860V2_AP_MBSS NEW_MBSSID_MODE \
	RT2860V2_AP_APCLI RT2860V2_AP_MAC_REPEATER RT2860V2_AP_IGMP_SNOOP RT2860V2_AP_NETIF_BLOCK RT2860V2_AP_DFS \
	RT2860V2_AP_CARRIER RT2860V2_AP_DLS RT2860V2_AP_IDS RT2860V2_HW_ANTENNA_DIVERSITY RT2860V2_AP_COC \
	RT2860V2_AP_MEMORY_OPTIMIZATION RT2860V2_AP_VIDEO_TURBINE RA_CLASSIFIER RT2860V2_AP_INTELLIGENT_RATE_ADAPTION \
	RT2860V2_AP_TXBF RT2860V2_AP_80211N_DRAFT3 RT2860V2_ADJ_PWR_CONSUMPTION_SUPPORT RT2860V2_SINGLE_SKU \
	RT2860V2_AP_RTMP_INTERNAL_TX_ALC RT2860V2_AP_RTMP_TEMPERATURE_COMPENSATION RT2860V2_AP_LED \
	INTERNAL_PA_EXTERNAL_LNA EXTERNAL_PA_EXTERNAL_LNA RT2860V2_EXT_CHANNEL_LIST
PKG_CONFIG_DEPENDS:=$(foreach c, $(PKG_KCONFIG),$(if $(CONFIG_$c),CONFIG_$(c)))

include $(INCLUDE_DIR)/package.mk

TAR_CMD=$(HOST_TAR) -C $(1)/ $(TAR_OPTIONS)

define KernelPackage/mt7620
  CATEGORY:=Ralink Properties
  TITLE:=Ralink MT7620 wifi AP driver
  FILES:=$(PKG_BUILD_DIR)/rt2860v2_ap/rt2860v2_ap.ko
  DEPENDS:=@TARGET_ramips +kmod-ralink-dep +uci2dat +wireless-tools +maccalc
  AUTOLOAD:=$(call AutoLoad,90,rt2860v2_ap)
  SUBMENU:=Drivers
  MENU:=1
endef

define KernelPackage/mt7620/config
	source "$(SOURCE)/Config-mt7620.in"
endef

define Build/Compile
	$(MAKE) -C "$(LINUX_DIR)" \
		CROSS_COMPILE="$(TARGET_CROSS)" \
		ARCH="$(LINUX_KARCH)" \
		SUBDIRS="$(PKG_BUILD_DIR)/rt2860v2_ap/" \
                M="$(PKG_BUILD_DIR)/rt2860v2_ap" \
                CONFIG_RT2860V2_AP=m \
		$(foreach c, $(PKG_KCONFIG),$(if $(CONFIG_$c),CONFIG_$(c)=$(CONFIG_$c)))\
		modules
endef

define KernelPackage/mt7620/install
	$(INSTALL_DIR) $(1)/lib/wifi/
	$(INSTALL_BIN) ./files/rt2860v2.sh $(1)/lib/wifi/
#	$(INSTALL_DIR) $(1)/etc/Wireless/mt7620/
#	$(INSTALL_BIN) ./files/mt7620.dat $(1)/etc/Wireless/mt7620/
#	$(INSTALL_BIN) ./files/mt7620.dat $(1)/etc/Wireless/mt7620/mt7620.dat.orig
#	-$(INSTALL_BIN) ./files/mt7620.eeprom.bin $(1)/etc/Wireless/mt7620/
endef

$(eval $(call KernelPackage,mt7620))
