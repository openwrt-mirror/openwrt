#
# Copyright (C) 2015 OpenWrt-dist
#
# This is free software, licensed under the GNU General Public License v3.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=openwrt-dist-luci
PKG_VERSION:=1.3.0
PKG_RELEASE:=1

PKG_LICENSE:=GPLv3
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=aa65535 <aa65535@live.com>

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/openwrt-dist-luci/Default
	SECTION:=luci
	CATEGORY:=LuCI
	SUBMENU:=3. Applications
	TITLE:=$(1) LuCI interface
	PKGARCH:=all
endef

Package/luci-app-chinadns = $(call Package/openwrt-dist-luci/Default,ChinaDNS)
Package/luci-app-redsocks2 = $(call Package/openwrt-dist-luci/Default,RedSocks2)
Package/luci-app-shadowvpn = $(call Package/openwrt-dist-luci/Default,ShadowVPN)
Package/luci-app-shadowsocks-spec = $(call Package/openwrt-dist-luci/Default,shadowsocks-libev-spec)

define Package/openwrt-dist-luci/description
	LuCI Support for $(1).
endef

Package/luci-app-chinadns/description = $(call Package/openwrt-dist-luci/description,ChinaDNS)
Package/luci-app-redsocks2/description = $(call Package/openwrt-dist-luci/description,RedSocks2)
Package/luci-app-shadowvpn/description = $(call Package/openwrt-dist-luci/description,ShadowVPN)
Package/luci-app-shadowsocks-spec/description = $(call Package/openwrt-dist-luci/description,shadowsocks-libev-spec)

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/openwrt-dist-luci/postinst
#!/bin/sh
if [ -z "$${IPKG_INSTROOT}" ]; then
	( . /etc/uci-defaults/luci-$(1) ) && rm -f /etc/uci-defaults/luci-$(1)
	chmod 755 /etc/init.d/$(1) >/dev/null 2>&1
	/etc/init.d/$(1) enable >/dev/null 2>&1
fi
exit 0
endef

Package/luci-app-chinadns/postinst = $(call Package/openwrt-dist-luci/postinst,chinadns)
Package/luci-app-redsocks2/postinst = $(call Package/openwrt-dist-luci/postinst,redsocks2)
Package/luci-app-shadowvpn/postinst = $(call Package/openwrt-dist-luci/postinst,shadowvpn)
Package/luci-app-shadowsocks-spec/postinst = $(call Package/openwrt-dist-luci/postinst,shadowsocks)

define Package/openwrt-dist-luci/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller
	$(INSTALL_DATA) ./files/luci/controller/$(2).lua $(1)/usr/lib/lua/luci/controller/$(2).lua
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/i18n
	$(INSTALL_DATA) ./files/luci/i18n/$(2).*.lmo $(1)/usr/lib/lua/luci/i18n
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/model/cbi
	$(INSTALL_DATA) ./files/luci/model/cbi/$(2).lua $(1)/usr/lib/lua/luci/model/cbi/$(2).lua
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./files/root/etc/uci-defaults/luci-$(2) $(1)/etc/uci-defaults/luci-$(2)
endef

Package/luci-app-chinadns/install = $(call Package/openwrt-dist-luci/install,$(1),chinadns)
Package/luci-app-redsocks2/install = $(call Package/openwrt-dist-luci/install,$(1),redsocks2)
Package/luci-app-shadowvpn/install = $(call Package/openwrt-dist-luci/install,$(1),shadowvpn)
Package/luci-app-shadowsocks-spec/install = $(call Package/openwrt-dist-luci/install,$(1),shadowsocks)

$(eval $(call BuildPackage,luci-app-chinadns))
$(eval $(call BuildPackage,luci-app-redsocks2))
$(eval $(call BuildPackage,luci-app-shadowvpn))
$(eval $(call BuildPackage,luci-app-shadowsocks-spec))
