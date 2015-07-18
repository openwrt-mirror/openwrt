#
# Copyright (C) 2015 wongsyrone
#
# This is free software, licensed under the GNU General Public License v3.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

PKG_NAME:=pcap-dnsproxy
PKG_VERSION:=0.4.2.5
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/chengr28/Pcap_DNSProxy.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=68557d3ae5c551b4f1a42b6ed2a04598713dbd53
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz

PKG_LICENSE:=GPL-2.0
PKG_LICENSE_FILES:=LICENSE
PKG_USE_MIPS16:=0

PKG_MAINTAINER:=Chengr28 <chengr28@twitter>

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

TARGET_CFLAGS += $(FPIC)

CMAKE_OPTIONS += \
	-DPLATFORM_OPENWRT=ON \
	$(if $(CONFIG_PACKAGE_pcap-dnsproxy_libsodium),-DENABLE_LIBSODIUM=ON,-DENABLE_LIBSODIUM=OFF) \
	-DENABLE_PCAP=ON

# Port 53 leads to dnsmasq startup failure.
define Package/pcap-dnsproxy/config
	if PACKAGE_pcap-dnsproxy
	config PACKAGE_pcap-dnsproxy_libsodium
		bool "Build with libsodium support."
		default y
	config PCAP_DNSPROXY_LISTENPORT
		int "Change default Listen Port, can NOT be 53"
		default 1053
	endif
endef

# Note: GCC 4.6 and 4.8 dont have complete C++11 support
#       Please use GCC 4.9 or higher to compile
#       Don't use regular expression when compiling with GCC 4.8
define Package/pcap-dnsproxy
	SECTION:=net
	CATEGORY:=Network
	TITLE:=A local DNS server based on LibPcap
	URL:=https://github.com/chengr28/Pcap_DNSProxy
	DEPENDS:=+libpthread +libstdcpp +libpcap \
		+PACKAGE_pcap-dnsproxy_libsodium:libsodium \
		@GCC_VERSION_4_6:BROKEN
endef

define Package/pcap-dnsproxy/conffiles
/etc/pcap-dnsproxy/Config.conf
/etc/pcap-dnsproxy/Hosts.conf
/etc/pcap-dnsproxy/IPFilter.conf
/etc/pcap-dnsproxy/Routing.txt
/etc/pcap-dnsproxy/White_List.txt
endef

# disable auto boot cause we have NOT set anything, and log poisoning will occur.
# we can also keep this section empty to avoid default postinst script.
define Package/pcap-dnsproxy/postinst
#!/bin/sh
/etc/init.d/pcap-dnsproxy stop
/etc/init.d/pcap-dnsproxy disable
exit 0
endef

# temporary not changed
# 	$(SED) 's,Operation Mode = Private,Operation Mode = Server,g'                   $(PKG_BUILD_DIR)/Source/ExampleConfig/Config.ini
define Package/pcap-dnsproxy/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/KeyPairGenerator $(1)/usr/sbin/KeyPairGenerator
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/Pcap_DNSProxy $(1)/usr/sbin/Pcap_DNSProxy
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/pcap-dnsproxy.init $(1)/etc/init.d/pcap-dnsproxy
	$(INSTALL_DIR) $(1)/etc/pcap-dnsproxy
	$(SED) 's,Listen Port = 53,Listen Port = $(CONFIG_PCAP_DNSPROXY_LISTENPORT),g'                          $(PKG_BUILD_DIR)/Source/ExampleConfig/Config.ini
	$(SED) 's,Buffer Queue Limits = 64,Buffer Queue Limits = 128,g'                                         $(PKG_BUILD_DIR)/Source/ExampleConfig/Config.ini
	$(SED) 's,Log Maximum Size = 8MB,Log Maximum Size = 50KB,g'                                             $(PKG_BUILD_DIR)/Source/ExampleConfig/Config.ini
	$(SED) 's,Accept Type = dummy value for sed tool,Accept Type = Permit:1|2|5|6|12|15|16|28|33|99,g'      $(PKG_BUILD_DIR)/Source/ExampleConfig/Config.ini
	$(SED) 's,EDNS Label = 0,EDNS Label = 1,g'                                                              $(PKG_BUILD_DIR)/Source/ExampleConfig/Config.ini
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/Source/ExampleConfig/Config.ini $(1)/etc/pcap-dnsproxy/Config.conf
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/Source/ExampleConfig/Hosts.ini $(1)/etc/pcap-dnsproxy/Hosts.conf
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/Source/ExampleConfig/IPFilter.ini $(1)/etc/pcap-dnsproxy/IPFilter.conf
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/Source/ExampleConfig/Routing.txt $(1)/etc/pcap-dnsproxy/Routing.txt
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/Source/ExampleConfig/White_List.txt $(1)/etc/pcap-dnsproxy/White_List.txt

endef


$(eval $(call BuildPackage,pcap-dnsproxy))
