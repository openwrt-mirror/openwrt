include $(TOPDIR)/rules.mk

PKG_NAME:=ChinaDNS

PKG_VERSION:=a423ccb292
PKG_RELEASE:=1
PKG_REV:=a423ccb292990c5a5ee2f4040c85bb9070208928

PKG_SOURCE_PROTO:=git
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_URL:=https://github.com/clowwindy/ChinaDNS.git
PKG_SOURCE_VERSION:=$(PKG_REV)

PKG_INSTALL:=1
PKG_FIXUP:=autoreconf
PKG_USE_MIPS16:=0
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/ChinaDNS/Default
  SECTION:=net
  CATEGORY:=Network
  TITLE:=ChinaDNS
	URL:=https://github.com/clowwindy/ChinaDNS
endef

define Package/ChinaDNS
  $(call Package/ChinaDNS/Default)
endef

define Package/ChinaDNS/description
A DNS forwarder that ignores incorrect(you knew it) responses.
endef

define Package/ChinaDNS/conffiles
/etc/chinadns_chnroute.txt
endef

define Package/ChinaDNS/install
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/chnroute.txt $(1)/etc/chinadns_chnroute.txt
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/chinadns $(1)/usr/bin
endef

$(eval $(call BuildPackage,ChinaDNS))
