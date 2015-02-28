#
# Copyright (C) 2010-2013 hua.shao@mediatek.com
#
# Ralink Property Software.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=btnd
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)
PKG_KCONFIG:=RALINK_MT7620 RALINK_MT7621
PKG_CONFIG_DEPENDS:=$(foreach c, $(PKG_KCONFIG),$(if $(CONFIG_$c),CONFIG_$(c)))


include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/kernel.mk

define Package/btnd
  SECTION:=Ralink Properties
  CATEGORY:=Ralink Properties
  TITLE:=Daemon to monitor gpio buttons
  SUBMENU:=Applications
endef

define Package/btnd/description
  Daemon to monitor gpio buttons
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)/
endef

TARGET_CFLAGS += \
	-I$(LINUX_DIR)/include \
	-I$(LINUX_DIR)/drivers/char/ \
	$(foreach c, $(PKG_KCONFIG),$(if $(CONFIG_$c),-DCONFIG_$(c)=$(CONFIG_$c)))


define Package/btnd/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_DIR) $(1)/etc/btnd
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/btnd $(1)/usr/bin
	-$(CP) ./files/*.sh  $(1)/etc/btnd/
endef


$(eval $(call BuildPackage,btnd))

