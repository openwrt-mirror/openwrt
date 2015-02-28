#
# Copyright (C) 2010-2013 hua.shao@mediatek.com
#
# Ralink Property Software.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=reg
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)
PKG_CONFIG_DEPENDS:=

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/kernel.mk

define Package/reg
  SECTION:=Ralink Properties
  CATEGORY:=Ralink Properties
  TITLE:=Read/Write registers from user space
  SUBMENU:=Applications
endef

define Package/reg/description
  An program to read/write ralink register.
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)/
endef

TARGET_CFLAGS += \
	-I$(LINUX_DIR)/arch/mips/include \
	-I$(LINUX_DIR)/include \
	-I$(LINUX_DIR)/drivers/net/rt_rdm

MAKE_FLAGS += \
	CFLAGS="$(TARGET_CFLAGS)"


define Build/Configure
endef

define Package/reg/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/reg $(1)/usr/bin
endef


$(eval $(call BuildPackage,reg))

