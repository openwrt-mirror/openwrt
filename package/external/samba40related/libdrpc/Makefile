# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=libdrpc
PKG_VERSION:=2013-07-26
PKG_RELEASE:=1
PKG_REV:=1f3d938733f6e9761348a02bdadcccd97f3938a3

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/idunham/libdrpc
PKG_SOURCE:=$(PKG_NAME).tar.bz2
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/libdrpc
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Port of Android librpc to more regular libc versions
  URL:=https://github.com/idunham/libdrpc
#  DEPENDS:=+
endef

define Package/libdrpc/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/local/lib/libdrpc.so* $(1)/usr/lib
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/local/lib/libdrpc.{a,so*} $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/local/include/* $(1)/usr/include
#	$(SED) 's,/usr,${STAGING_DIR}/usr,g' $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/libdrpc.pc
#	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/libdrpc.pc $(1)/usr/lib/pkgconfig/libdrpc.pc
endef

$(eval $(call BuildPackage,libdrpc))
