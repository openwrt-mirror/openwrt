#
# Copyright (C) 2006-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=ufsd-mipseb-3.14

PKG_VERSION:=1
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(KERNEL_BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_UNPACK=mkdir -p $(PKG_BUILD_DIR); $(CP) ./obj/* $(PKG_BUILD_DIR)/

include $(INCLUDE_DIR)/package.mk


define KernelPackage/ufsd-mipseb-3.14
  SUBMENU:=Filesystems
  TITLE:=Paragon ufsd for mipseb kernel-3.14
  DEPENDS:=+kmod-nls-base +kmod-nls-utf8
  FILES:=$(PKG_BUILD_DIR)/ufsd.ko
  AUTOLOAD:=$(call AutoLoad,30,ufsd)
endef

define KernelPackage/ufsd-mipseb-3.14/description
Paragon ufsd is a fs driverof ntfs
endef

define Build/Compile
endef

define KernelPackage/ufsd-mipseb-3.14/install
endef

$(eval $(call KernelPackage,ufsd-mipseb-3.14))
