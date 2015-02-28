#
# Copyright (C) 2010-2013 hua.shao@mediatek.com
#
# Ralink Property Software.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=switch
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)
PKG_KCONFIG:=RALINK_MT7620 RALINK_MT7621
PKG_CONFIG_DEPENDS:=$(foreach c, $(PKG_KCONFIG),$(if $(CONFIG_$c),CONFIG_$(c)))


include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/kernel.mk

define Package/switch
  SECTION:=Ralink Properties
  CATEGORY:=Ralink Properties
  TITLE:=Command to config switch
  SUBMENU:=Applications
endef

define Package/switch/description
  An program to config switch.
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)/
endef

TARGET_CFLAGS += \
	-I$(LINUX_DIR)/include \
	-I$(LINUX_DIR)/drivers/net/raeth \
	$(foreach c, $(PKG_KCONFIG),$(if $(CONFIG_$c),-DCONFIG_$(c)))

define Build/Configure
endef

define Package/switch/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_DIR) $(1)/lib/network
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/switch $(1)/usr/bin
	$(INSTALL_BIN) ./files/switch.sh $(1)/lib/network
endef


$(eval $(call BuildPackage,switch))

