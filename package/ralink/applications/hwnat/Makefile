#
# Copyright (C) 2010-2013 hua.shao@mediatek.com
#
# Ralink Property Software.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=hwnat
PKG_RELEASE:=4200

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)
PKG_KCONFIG:=RALINK_MT7620 HNAT_V2
PKG_CONFIG_DEPENDS:=$(foreach c, $(PKG_KCONFIG),$(if $(CONFIG_$c),CONFIG_$(c)))


include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/kernel.mk

define Package/hwnat
  SECTION:=Ralink Properties
  CATEGORY:=Ralink Properties
  TITLE:=Hardware NAT command
  DEPENDS:=@PACKAGE_kmod-hw_nat
  SUBMENU:=Applications
endef

define Package/hwnat/description
  An program to query info from hwnat driver
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)/
endef

TARGET_CFLAGS += \
	-I$(LINUX_DIR)/include \
	-I$(LINUX_DIR)/net/nat/hw_nat/ \
        $(foreach c, $(PKG_KCONFIG),$(if $(CONFIG_$c),-DCONFIG_$(c)=$(CONFIG_$c)))

MAKE_FLAGS += \
	CFLAGS="$(TARGET_CFLAGS)"


define Build/Configure
endef

define Package/hwnat/install
	$(INSTALL_DIR) $(1)/bin
	$(INSTALL_DIR) $(1)/etc/init.d/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/ac $(1)/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/acl $(1)/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/hwnat $(1)/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/mtr $(1)/bin
	$(INSTALL_BIN) ./files/* $(1)/etc/init.d
endef


$(eval $(call BuildPackage,hwnat))

