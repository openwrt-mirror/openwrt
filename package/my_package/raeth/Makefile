#
# Copyright (C) 2006-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=raeth

PKG_VERSION:=3
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(KERNEL_BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

PKG_KCONFIG:=PDMA_NEW RAETH_SCATTER_GATHER_RX_DMA RA_NETWORK_TASKLET_BH RA_NETWORK_WORKQUEUE_BH RAETH_NAPI RAETH_SKB_RECYCLE_2K RAETH_SPECIAL_TAG RAETH_JUMBOFRAME RAETH_CHECKSUM_OFFLOAD 32B_DESC RAETH_LRO RAETH_HW_VLAN_TX RAETH_HW_VLAN_RX RAETH_TSO RAETH_TSOV6 RAETH_RW_PDMAPTR_FROM_VAR RAETH_QOS_DSCP_BASED RAETH_QOS_VPRI_BASED GE1_MII_FORCE_100 GE1_MII_AN GE1_RVMII_FORCE_100 GE1_RGMII_FORCE_1000 GE1_RGMII_AN RT_3052_ESW LAN_WAN_SUPPORT WAN_AT_P4 WAN_AT_P0 RALINK_VISTA_BASIC ESW_DOUBLE_VLAN_TAG RAETH_HAS_PORT4 P4_MAC_TO_PHY_MODE P4_RGMII_TO_MAC_MODE P4_MII_TO_MAC_MODE P4_RMII_TO_MAC_MODE MAC_TO_GIGAPHY_MODE_ADDR2 RAETH_HAS_PORT5 P5_MAC_TO_PHY_MODE P5_RGMII_TO_MAC_MODE P5_MII_TO_MAC_MODE P5_RMII_TO_MAC_MODE MAC_TO_GIGAPHY_MODE_ADDR MAC_TO_GIGAPHY_MODE_ADDR RAETH_GMAC2 GE2_MII_FORCE_100 GE2_MII_AN GE2_RVMII_FORCE_100 GE2_RGMII_FORCE_1000 GE2_RGMII_AN MAC_TO_GIGAPHY_MODE_ADDR2 RAETH_ROUTER MAC_TO_MAC_MODE GIGAPHY 100PHY

define KernelPackage/raeth
  SUBMENU:=Kernel Modules
  TITLE:=Ralink GMAC
#  DEPENDS:=@TARGET_ramips +wireless-tools +maccalc
#  DEFAULT:=y if (CONFIG_TARGET_ramips_mt7620n || CONFIG_TARGET_ramips_mt7620a)
  FILES:=$(PKG_BUILD_DIR)/raeth.ko
  AUTOLOAD:=$(call AutoLoad,50,raeth)
endef

define KernelPackage/raeth/description
This driver supports Ralink gigabit ethernet family of adapters.
endef

define KernelPackage/raeth/config
	source "$(SOURCE)/config.in"
endef

SOURCE_DIR:=$(PKG_BUILD_DIR)
export SOURCE_DIR

MAKEOPTS:= -C $(LINUX_DIR) \
                ARCH="$(LINUX_KARCH)" \
                CROSS_COMPILE="$(TARGET_CROSS)" \
                M="$(PKG_BUILD_DIR)" \
                CONFIG_RAETH=m \
		$(foreach c, $(PKG_KCONFIG),$(if $(CONFIG_$c),CONFIG_$(c)=y)) \
		modules

define Build/Prepare
	$(call Build/Prepare/Default)
	$(CP) -r src/. $(PKG_BUILD_DIR)
endef


define Build/Compile
	$(MAKE) $(MAKEOPTS)
endef

define KernelPackage/raeth/install
endef

$(eval $(call KernelPackage,raeth))
