#
# Copyright (C) 2015 wongsyrone
#
# This is free software, licensed under the MIT.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

PKG_NAME:=pcap-dnsproxy
PKG_VERSION:=0.4.2.1-d2c2c17a2f
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/chengr28/Pcap_DNSProxy.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=d2c2c17a2f8c1d7040822dbad8f3af0d6cce597d
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz
CMAKE_INSTALL:=1

PKG_LICENSE:=GPL-2.0
PKG_LICENSE_FILES:=LICENSE
PKG_BUILD_DEPENDS:=libsodium libpcap
PKG_USE_MIPS16:=0

PKG_MAINTAINER:=Chengr28 <chengr28@twitter>

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

TARGET_CFLAGS += $(FPIC)
#TARGET_LDFLAGS += -L$(STAGING_DIR)/usr/lib
TARGET_LDFLAGS += -lsodium -lpcap

define Package/pcap-dnsproxy
	SECTION:=net
	CATEGORY:=Network
	TITLE:=A local DNS server based on LibPcap
	URL:=https://github.com/chengr28/Pcap_DNSProxy
	DEPENDS:=+libpthread +libstdcpp +libpcap +libsodium
endef

#CONFIGURE_ARGS := -DENABLE_LIBSODIUM=ON -DENABLE_PCAP=ON

# TODO: add start-stop-daemon service script
define Package/pcap-dnsproxy/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/KeyPairGenerator $(1)/usr/sbin/KeyPairGenerator
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/Pcap_DNSProxy $(1)/usr/sbin/Pcap_DNSProxy

endef


$(eval $(call BuildPackage,pcap-dnsproxy))