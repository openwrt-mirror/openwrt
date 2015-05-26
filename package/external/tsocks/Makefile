#
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#


include $(TOPDIR)/rules.mk

PKG_NAME:=tsocks
PKG_VERSION:=1.8
PKG_RELEASE:=1
PKG_MD5SUM:=51caefd77e5d440d0bbd6443db4fc0f8

PKG_SOURCE_URL:=@SF/tsocks
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)beta5.tar.gz

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/tsocks
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Web Servers/Proxies
  TITLE:=Transparent SOCKS v4 proxying library
  DEPENDS:=BROKEN
  URL:=http://tsocks.sourceforge.net/
endef

define Package/tsocks/description
Transparent SOCKS v4 proxying library
endef

define Build/Configure
        $(call Build/Configure/Default,\
			--enable-socksdns \
			--disable-hostnames \
			--with-conf=/etc/tsocks.conf \
        )
endef
## unsure CP line and PKG_INSTALL_DIR
define Package/tsocks/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/tsocks $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/lib/libtsocks.so{,*} $(1)/usr/lib/
	$(INSTALL_DATA) ./files/tsocks.conf $(1)/etc/tsocks.conf
endef

$(eval $(call BuildPackage,tsocks))
