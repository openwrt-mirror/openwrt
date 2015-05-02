include $(TOPDIR)/rules.mk

PKG_NAME:=cpulimit
PKG_VERSION:=fd48ecf5a1
PKG_RELEASE:=1
PKG_REV:=fd48ecf5a123ddaf5dd02d7928f975db719975bb

#PKG_SOURCE_PROTO:=git
#PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
#PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
#PKG_SOURCE_URL:=https://github.com/opsengine/cpulimit.git
#PKG_SOURCE_VERSION:=$(PKG_REV)

include $(INCLUDE_DIR)/package.mk

define Package/cpulimit
	CATEGORY:=Utilities
	TITLE:=cpulimit
	URL:=https://github.com/opsengine/cpulimit.git
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)/
endef

define Package/cpulimit/install
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) ./files/cpulimit.config $(1)/etc/config/cpulimit
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/cpulimit.init $(1)/etc/init.d/cpulimit
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/cpulimit $(1)/usr/bin
endef


$(eval $(call BuildPackage,cpulimit))
