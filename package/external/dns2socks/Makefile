include $(TOPDIR)/rules.mk

PKG_NAME:=dns2socks
PKG_VERSION:=2.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

PKG_UNPACK=mkdir -p $(PKG_BUILD_DIR); $(CP) ./src/* $(PKG_BUILD_DIR)/

define Package/dns2socks
	SECTION:=net
	CATEGORY:=Network
	TITLE:=DNS to SOCKS proxy
	URL:=http://sourceforge.net/projects/dns2socks/
	DEPENDS:=+libpthread
endef

define Package/dns2socks/description
DNS2SOCKS is a command line utility running to forward DNS requests to a DNS server via a SOCKS tunnel.
endef

define Build/Compile
	$(TARGET_CROSS)gcc -pthread -Wall -Os -o $(PKG_BUILD_DIR)/dns2socks $(PKG_BUILD_DIR)/DNS2SOCKS.c
endef

define Package/dns2socks/install
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) ./files/dns2socks.config $(1)/etc/config/dns2socks
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/dns2socks.init $(1)/etc/init.d/dns2socks
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/dns2socks $(1)/usr/bin
endef


$(eval $(call BuildPackage,dns2socks))