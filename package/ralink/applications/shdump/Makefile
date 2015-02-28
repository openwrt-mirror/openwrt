#
# Copyright (C) 2010-2013 hua.shao@mediatek.com
#
# Ralink Property Software.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=shdump
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)
PKG_CONFIG_DEPENDS:=

include $(INCLUDE_DIR)/package.mk

define Package/shdump
  SECTION:=Ralink Properties
  CATEGORY:=Ralink Properties
  TITLE:=Dump file data in hex and ascii view
  SUBMENU:=Applications
endef

define Package/shdump/description
  Dump file data in hex and asci view.
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)/
endef

define Build/Configure
endef

define Package/shdump/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/shdump $(1)/usr/bin
endef


$(eval $(call BuildPackage,shdump))

