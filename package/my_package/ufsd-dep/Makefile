#
# Copyright (C) 2006-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=ufsd-dep

PKG_VERSION:=1
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(KERNEL_BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_UNPACK=mkdir -p $(PKG_BUILD_DIR); $(CP) ./src/* $(PKG_BUILD_DIR)/


include $(INCLUDE_DIR)/package.mk


define KernelPackage/ufsd-dep
  SUBMENU:=Other modules
  TITLE:=Export symbols
  FILES:=$(PKG_BUILD_DIR)/ufsd-dep.ko
  AUTOLOAD:=$(call AutoLoad,10,ufsd-dep)
endef

define KernelPackage/ufsd-dep/description
 Ralink Flash functions.
endef


SOURCE_DIR:=$(PKG_BUILD_DIR)
export SOURCE_DIR


define Build/Compile
	$(MAKE) -C $(LINUX_DIR) \
                ARCH="$(LINUX_KARCH)" \
                CROSS_COMPILE="$(TARGET_CROSS)" \
                M="$(PKG_BUILD_DIR)" \
                CONFIG_UFSD_DEP=m \
		modules
endef

define KernelPackage/ufsd-dep/install
endef

$(eval $(call KernelPackage,ufsd-dep))
