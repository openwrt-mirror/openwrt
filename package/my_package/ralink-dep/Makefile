#
# Copyright (C) 2006-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=ralink-dep

PKG_VERSION:=1
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(KERNEL_BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_UNPACK=mkdir -p $(PKG_BUILD_DIR); $(CP) ./src/* $(PKG_BUILD_DIR)/


include $(INCLUDE_DIR)/package.mk


define KernelPackage/ralink-dep
  SUBMENU:=Other modules
  TITLE:=Ralink Flash functions.Provides some symbols for Ralink AP driver
  DEPENDS:=@TARGET_ramips
  FILES:=$(PKG_BUILD_DIR)/ralink-dep.ko
  AUTOLOAD:=$(call AutoLoad,10,ralink-dep)
endef

define KernelPackage/ralink-dep/description
 Ralink Flash functions.
endef


SOURCE_DIR:=$(PKG_BUILD_DIR)
export SOURCE_DIR


define Build/Compile
	$(MAKE) -C $(LINUX_DIR) \
                ARCH="$(LINUX_KARCH)" \
                CROSS_COMPILE="$(TARGET_CROSS)" \
                M="$(PKG_BUILD_DIR)" \
                CONFIG_MTD_RALINK=m \
		modules
endef

define KernelPackage/ralink-dep/install
	$(INSTALL_DIR) $(1)/lib/wifi
	$(INSTALL_BIN) ./files/rtwifi.sh $(1)/lib/wifi/ralink_common.sh
endef

$(eval $(call KernelPackage,ralink-dep))
