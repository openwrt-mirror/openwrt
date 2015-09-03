#
# Copyright (C) 2010-2012 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

PKG_NAME:=qemu
PKG_VERSION:=2.0.0
PKG_RELEASE:=1

PKG_SOURCE_URL:=@SAVANNAH/qemu
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_MD5SUM:=2790f44fd76da5de5024b4aafeb594c2

include $(INCLUDE_DIR)/host-build.mk

HOST_CFLAGS += -I$(STAGING_DIR_HOST)/include/e2fsprogs

define Host/Configure
	(cd $(HOST_BUILD_DIR); \
		PKG_CONFIG=/usr/bin/pkg-config \
		PKG_CONFIG_LIBDIR=/usr/lib/pkgconfig:/usr/share/pkgconfig \
		PKG_CONFIG_PATH=/usr/lib/pkgconfig:/usr/share/pkgconfig \
		CFLAGS="$(HOST_CFLAGS)" \
		LDFLAGS="$(HOST_LDFLAGS)" \
		$(HOST_CONFIGURE_CMD) \
		--extra-cflags="$(HOST_CFLAGS)" \
		--enable-uuid \
	)
endef

define Host/Compile
	$(MAKE) $(HOST_JOBS) -C $(HOST_BUILD_DIR) qemu-img
endef

define Host/Install
	$(INSTALL_DIR) $(STAGING_DIR_HOST)/bin
	$(INSTALL_BIN) $(HOST_BUILD_DIR)/qemu-img $(STAGING_DIR_HOST)/bin
endef

$(eval $(call HostBuild))
