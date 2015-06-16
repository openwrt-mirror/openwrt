#
# Copyright (C) 2015 wongsyrone
#
# This is free software, licensed under the MIT.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

PKG_NAME:=pcap-dnsproxy
PKG_VERSION:=0.4.2.2-b26489bb9f
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/chengr28/Pcap_DNSProxy.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=b26489bb9f8d74388a332b5b565168630beed0b8
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz

PKG_LICENSE:=GPL-2.0
PKG_LICENSE_FILES:=LICENSE
PKG_USE_MIPS16:=0

PKG_MAINTAINER:=Chengr28 <chengr28@twitter>

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

TARGET_CFLAGS += $(FPIC)

CMAKE_OPTIONS += \
	-DCOMPILE_OPENWRT=ON \
	$(if $(CONFIG_PACKAGE_pcap-dnsproxy_libsodium),-DENABLE_LIBSODIUM=ON,-DENABLE_LIBSODIUM=OFF) \
	-DENABLE_PCAP=ON

define Package/pcap-dnsproxy/config
	if PACKAGE_pcap-dnsproxy
	config PACKAGE_pcap-dnsproxy_libsodium
		bool "Build with libsodium support."
		default y
	endif
endef


define Package/pcap-dnsproxy
	SECTION:=net
	CATEGORY:=Network
	TITLE:=A local DNS server based on LibPcap
	URL:=https://github.com/chengr28/Pcap_DNSProxy
	DEPENDS:=+libpthread +libstdcpp +libpcap \
		+PACKAGE_pcap-dnsproxy_libsodium:libsodium
endef

define Package/pcap-dnsproxy/conffiles
/etc/pcap-dnsproxy/Config.conf
/etc/pcap-dnsproxy/Hosts.conf
/etc/pcap-dnsproxy/IPFilter.conf
/etc/pcap-dnsproxy/Routing.txt
/etc/pcap-dnsproxy/White_List.txt
endef

define Package/pcap-dnsproxy/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/KeyPairGenerator $(1)/usr/sbin/KeyPairGenerator
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/Pcap_DNSProxy $(1)/usr/sbin/Pcap_DNSProxy
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/pcap-dnsproxy.init $(1)/etc/init.d/pcap-dnsproxy
	$(INSTALL_DIR) $(1)/etc/pcap-dnsproxy
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/Source/ExampleConfig/Config.ini $(1)/etc/pcap-dnsproxy/Config.conf
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/Source/ExampleConfig/Hosts.ini $(1)/etc/pcap-dnsproxy/Hosts.conf
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/Source/ExampleConfig/IPFilter.ini $(1)/etc/pcap-dnsproxy/IPFilter.conf
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/Source/ExampleConfig/Routing.txt $(1)/etc/pcap-dnsproxy/Routing.txt
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/Source/ExampleConfig/White_List.txt $(1)/etc/pcap-dnsproxy/White_List.txt

endef


$(eval $(call BuildPackage,pcap-dnsproxy))