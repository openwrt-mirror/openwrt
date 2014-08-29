#
# Copyright (C) 2006-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=ufsd-ar71xx-3.10

PKG_VERSION:=1
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(KERNEL_BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk


define KernelPackage/ufsd-ar71xx-3.10
  SUBMENU:=Filesystems
  TITLE:=Paragon ufsd for ar71xx kernel-3.10
  DEPENDS:=+kmod-nls-base +kmod-nls-utf8
  FILES:=$(PKG_BUILD_DIR)/ufsd.ko
  AUTOLOAD:=$(call AutoLoad,50,ufsd)
endef

define KernelPackage/ufsd-ar71xx-3.10/description
Paragon ufsd is a fs driverof ntfs
endef


define Build/Prepare
	$(CP) -r obj/. $(PKG_BUILD_DIR)
endef


define Build/Compile
endef

define KernelPackage/ufsd-ar71xx-3.10/install
endef

$(eval $(call KernelPackage,ufsd-ar71xx-3.10))
