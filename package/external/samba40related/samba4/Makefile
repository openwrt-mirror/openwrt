#
# Copyright (C) 2007-2012 OpenWrt.org && leonghui/openwrt-addpack@GitHub && wongsyrone
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=samba40
PKG_VERSION:=4.0.26
PKG_RELEASE:=6

PKG_SOURCE_URL:=http://ftp.samba.org/pub/samba \
	http://ftp.samba.org/pub/samba/old-versions
PKG_SOURCE:=samba-$(PKG_VERSION).tar.gz
PKG_BUILD_DIR:=$(BUILD_DIR)/samba-$(PKG_VERSION)
PKG_MD5SUM:=ef513f1227de8335083a24009f52b468

PKG_LICENSE:=GPLv3
PKG_LICENSE_FILES:=COPYING

#PKG_BUILD_DEPENDS:=luci
#PO2LMO:=$(STAGING_DIR_HOST)/bin/po2lmo

PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

MAKE_PATH:=source3
CONFIGURE_PATH:=source3

PKG_BUILD_BIN:=$(PKG_BUILD_DIR)/$(MAKE_PATH)/bin

define Package/samba40-server
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Samba $(PKG_VERSION) SMB/CIFS server
  URL:=http://www.samba.org/
  VARIANT:=samba40-server
  DEPENDS:=+zlib
endef

define Package/samba40-client
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Samba $(PKG_VERSION) SMB/CIFS client
  URL:=http://www.samba.org/
#  DEPENDS:=+libreadline +libncurses +libopenldap-sals +krb5-mit-libs +libaio +zlib
endef

define Package/samba40-server/description
 The Samba software suite is a collection of programs that implements the
 SMB protocol for UNIX systems, allowing you to serve files and printers to
 Windows, NT, OS/2 and DOS clients. This protocol is sometimes also referred
 to as the LanManager or Netbios protocol.
endef

define Package/luci-app-$(PKG_NAME)
  SECTION:=luci
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  DEPENDS:=+samba40-server
  TITLE:=Samba 4
endef

TARGET_CFLAGS += \
	-D_GNU_SOURCE \
	-ffunction-sections -fdata-sections

TARGET_LDFLAGS += -Wl,--gc-sections

# can NOT detect endian while cross compiling, now for ARM(little endian)
# also should do some sizeof check before

# should check before compile
#	samba_cv_big_endian=no \
	samba_cv_little_endian=yes \
	samba_cv_SIZEOF_BLKCNT_T_4=no \
	samba_cv_SIZEOF_BLKCNT_T_8=yes \
	samba_cv_SIZEOF_DEV_T=8 \
	samba_cv_SIZEOF_INO_T=8 \
	samba_cv_SIZEOF_OFF_T=8 \
	samba_cv_SIZEOF_TIME_T=4 \
	samba_cv_TIME_T_MAX=no \
	samba_cv_have_longlong=yes 

CONFIGURE_VARS += \
	ac_cv_file__proc_sys_kernel_core_pattern=yes \
	libreplace_cv_HAVE_C99_VSNPRINTF=yes \
	libreplace_cv_HAVE_GETADDRINFO=yes \
	libreplace_cv_HAVE_IFACE_IFCONF=yes \
	libreplace_cv_HAVE_IFACE_GETIFADDRS=yes \
	libreplace_cv_HAVE_SECURE_MKSTEMP=yes \
	libreplace_cv_REPLACE_INET_NTOA=no \
	libreplace_cv_HAVE_MREMAP=yes \
	libreplace_cv_HAVE_MMAP=yes \
	libreplace_cv_HAVE_OPEN_O_DIRECT=yes \
	LINUX_LFS_SUPPORT=yes \
	samba_cv_big_endian=no \
	samba_cv_little_endian=yes \
	samba_cv_SIZEOF_BLKCNT_T_4=no \
	samba_cv_SIZEOF_BLKCNT_T_8=yes \
	samba_cv_SIZEOF_DEV_T=8 \
	samba_cv_SIZEOF_INO_T=8 \
	samba_cv_SIZEOF_OFF_T=8 \
	samba_cv_SIZEOF_TIME_T=4 \
	samba_cv_TIME_T_MAX=no \
	samba_cv_have_longlong=yes \
	samba_cv_CC_NEGATIVE_ENUM_VALUES=yes \
	samba_cv_HAVE_BROKEN_GETGROUPS=no \
	samba_cv_HAVE_BROKEN_READDIR_NAME=no \
	samba_cv_HAVE_BROKEN_READLINK=no \
	samba_cv_HAVE_KERNEL_CHANGE_NOTIFY=yes \
	samba_cv_HAVE_KERNEL_SHARE_MODES=yes \
	samba_cv_HAVE_MAKEDEV=yes \
	samba_cv_HAVE_GETTIMEOFDAY_TZ=yes \
	samba_cv_HAVE_IFACE_IFCONF=yes \
	samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=yes \
	samba_cv_HAVE_SECURE_MKSTEMP=yes \
	samba_cv_HAVE_WRFILE_KEYTAB=no \
	samba_cv_USE_SETRESUID=yes \
	samba_cv_USE_SETRESGID=yes \
	samba_cv_USE_SETREUID=yes \
	samba_cv_have_setresuid=yes \
	samba_cv_have_setresgid=yes \
	samba_cv_linux_getgrouplist_ok=yes \
	ac_cv_header_zlib_h=yes \
	samba_cv_zlib_1_2_3=yes
# changed ac_cv_header_zlib_h && samba_cv_zlib_1_2_3
# due to PKG_RELRO_FULL delete '--disable-relro'
CONFIGURE_ARGS += \
	--exec-prefix=/usr \
	--prefix=/ \
	--disable-avahi \
	--disable-cups \
	--disable-pie \
	--disable-static \
	--disable-swat \
	--disable-shared-libs \
	--with-configdir=/etc/samba \
	--with-included-iniparser \
	--with-included-popt \
	--with-lockdir=/var/lock \
	--with-logfilebase=/var/log \
	--with-piddir=/var/run \
	--with-privatedir=/etc/samba \
	--with-sendfile-support \
	--without-aio-support \
	--without-cluster-support \
	--without-pam \
	--without-winbind \
	--without-libtdb \
	--without-libtalloc \
	--without-libnetapi \
	--without-libsmbclient \
	--without-libsmbsharemodes \
	--without-ads \
	--without-krb5 \
	--without-ldap \
	--with-libiconv="$(ICONV_PREFIX)" \
	--without-acl-support \
	--without-quotas \
	--without-syslog \
	--with-shared-modules=pdb_tdbsam,pdb_wbc_sam,idmap_nss,nss_info_template,auth_winbind,auth_wbc,auth_domain,vfs \
	--with-static-modules=vfs_default

MAKE_FLAGS += DYNEXP= PICFLAG= MODULES=

define Package/samba40-server/install
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) ./files/samba40.config $(1)/etc/config/samba4
	$(INSTALL_DIR) $(1)/etc/samba
	$(INSTALL_DATA) ./files/smb.conf.template $(1)/etc/samba
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/codepages/lowcase.dat $(1)/etc/samba
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/codepages/upcase.dat $(1)/etc/samba
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/codepages/valid.dat $(1)/etc/samba
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/$(PKG_NAME).init $(1)/etc/init.d/samba4
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_BIN)/samba4_multicall $(1)/usr/sbin
	$(LN) samba4_multicall $(1)/usr/sbin/smbd
	$(LN) samba4_multicall $(1)/usr/sbin/nmbd
	$(LN) samba4_multicall $(1)/usr/sbin/smbpasswd
	$(INSTALL_DIR) $(1)/usr/bin
	$(LN) ../sbin/samba4_multicall $(1)/usr/bin/smbcontrol
	$(LN) ../sbin/samba4_multicall $(1)/usr/bin/smbtree
	$(LN) ../sbin/samba4_multicall $(1)/usr/bin/smbstatus
	$(LN) ../sbin/samba4_multicall $(1)/usr/bin/smbcquotas
	$(LN) ../sbin/samba4_multicall $(1)/usr/bin/smbcacls
	$(LN) ../sbin/samba4_multicall $(1)/usr/bin/nmblookup
	$(LN) ../sbin/samba4_multicall $(1)/usr/bin/testparm
	$(INSTALL_DIR) $(1)/etc/samba
	$(LN) /var/etc/secrets.tdb $(1)/etc/samba/secrets.tdb
	$(LN) /var/etc/schannel_store.tdb $(1)/etc/samba/schannel_store.tdb
endef

define Package/samba40-server/conffiles
/etc/config/samba4
/etc/samba/smb.conf.template
/etc/samba/smbpasswd
endef

define Package/samba40-client/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_BIN)/smbclient $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_BIN)/nmblookup $(1)/usr/sbin
endef

define Package/luci-app-$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller
	$(INSTALL_DATA) files/$(PKG_NAME).controller.lua $(1)/usr/lib/lua/luci/controller/$(PKG_NAME).lua
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/model/cbi
	$(INSTALL_DATA) files/$(PKG_NAME).cbi.lua $(1)/usr/lib/lua/luci/model/cbi/$(PKG_NAME).lua
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/i18n
	for transl in files/*.po; do \
		transl_dest=`basename $$$$transl .po`.lmo; \
		$(PO2LMO) $$$$transl $(1)/usr/lib/lua/luci/i18n/$$$$transl_dest; \
	done
endef

#$(eval $(call BuildPackage,$(PKG_NAME)-client))
$(eval $(call BuildPackage,$(PKG_NAME)-server))
#$(eval $(call BuildPackage,luci-app-$(PKG_NAME)))
