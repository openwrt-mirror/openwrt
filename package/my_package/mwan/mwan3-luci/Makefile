#
# Copyright (C) 2010-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-mwan3
PKG_VERSION:=1.2
PKG_RELEASE:=19

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-mwan3
  SECTION:=LuCI
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  TITLE:=LuCI Support for MWAN3 multiwan policy routing
  DEPENDS:=+mwan3
  PKGARCH:=all
  MAINTAINER:=Aedan Renner <chipdankly@gmail.com>
endef

define Package/luci-app-mwan3/description
MWAN3 LuCI configuration module. MWAN3 is a hotplug script that makes configuration of multiple WAN interfaces simple, easy and manageable. With load balancing support, connection tracking with failover and an easy to manage traffic ruleset. The MWAN3 application is maintained by Jeroen Louwes <jeroen.louwes@gmail.com>
endef

define Build/Compile
endef

define Package/luci-app-mwan3/install
	$(CP) ./files/* $(1)
endef

$(eval $(call BuildPackage,luci-app-mwan3))
