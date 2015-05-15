#
# Copyright (C) 2007-2012 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
#  Status: need investigate and much work on this pkg
####################### Should NOT use this pkg at this point
## TODO: determine what component is necessary for a basic samba server
##       others can be configure switches, so the question is what are basic components.
####################### Should NOT use this pkg at this point
include $(TOPDIR)/rules.mk

PKG_NAME:=samba4
PKG_VERSION:=4.2.1
PKG_RELEASE:=1

PKG_SOURCE_URL:=http://ftp.samba.org/pub/samba \
	http://ftp.samba.org/pub/samba/old-versions
PKG_SOURCE:=samba-$(PKG_VERSION).tar.gz
PKG_BUILD_DIR:=$(BUILD_DIR)/samba-$(PKG_VERSION)
PKG_MD5SUM:=614b4c7b9bbc70cff4cb56956f565741

PKG_LICENSE:=GPLv3
PKG_LICENSE_FILES:=COPYING

PKG_BUILD_DEPENDS:=python

PKG_BUILD_PARALLEL:=1
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/kernel.mk


PKG_BUILD_BIN:=$(PKG_BUILD_DIR)/$(MAKE_PATH)/bin

define Package/samba4-server
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Samba $(PKG_VERSION) SMB/CIFS server
  URL:=http://www.samba.org/
  VARIANT:=samba4-server
  DEPENDS:=BROKEN
  #DEPENDS:=+USE_EGLIBC:librt +libpopt +libiconv +libreadline
endef

define Package/samba4-client
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Samba $(PKG_VERSION) SMB/CIFS client
  URL:=http://www.samba.org/
  DEPENDS:=BROKEN
  #DEPENDS:=+libreadline +libncurses +zlib
endef

define Package/samba4-server/config
config PACKAGE_SAMBA4_MAX_DEBUG_LEVEL
	int "Maximum level of compiled-in debug messages"
	depends on PACKAGE_samba4-server || PACKAGE_samba4-client
	default -1
endef

define Package/samba42-server/description
 The Samba software suite is a collection of programs that implements the
 SMB protocol for UNIX systems, allowing you to serve files and printers to
 Windows, NT, OS/2 and DOS clients. This protocol is sometimes also referred
 to as the LanManager or Netbios protocol.
endef


TARGET_CFLAGS += \
	-DMAX_DEBUG_LEVEL=$(CONFIG_PACKAGE_SAMBA4_MAX_DEBUG_LEVEL) \
	-DACTIVE_DIRECTORY \
	-DDFS_SUPPORT \
	-DNETLOGON_SUPPORT \
	-DSAMR_SUPPORT \
	-DLSA_SUPPORT \
	-D_GNU_SOURCE \
	-ffunction-sections -fdata-sections

CONFIGURE_VARS += \
	PYTHON_CONFIG="$(STAGING_DIR_HOST)/bin/python-config" \
	python_LDFLAGS="" \
	python_LIBDIR=""

SAMBA4_CONFIGURE_ARGS = \
	--disable-rpath \
	--cross-compile \
	--cross-answers=$(PKG_BUILD_DIR)/cache.txt \
	--disable-rpath \
	--disable-rpath-install \
	--exec-prefix=/usr \
	--prefix=/ \
	--disable-avahi \
	--disable-cups \
	--disable-iprint \
	--disable-gnutls \
	--with-relro \
	--without-pie \
	--with-configdir=/etc/samba \
	--with-lockdir=/var/lock \
	--with-logfilebase=/var/log \
	--with-piddir=/var/run \
	--with-privatedir=/etc/samba \
	--with-sendfile-support \
	--without-aio-support \
	--without-cluster-support \
	--without-pam \
	--without-winbind \
	--without-dnsupdate \
	--without-ads \
	--without-ldap \
	--without-ad-dc \
	--with-libiconv=$(STAGING_DIR)/usr/lib/libiconv \
	--without-acl-support \
	--without-quotas \
	--with-syslog \
	--without-systemd \
	--nopyo \
	--nopyc \
	--with-shared-modules=pdb_tdbsam,pdb_wbc_sam,idmap_nss,nss_info_template,vfs \
	--with-static-modules=vfs_default,vfs_dirsort,auth_wbc,auth_domain \
	--bundled-libraries='!asn1_compile,!compile_et'

#	--builtin-libraries= \




# Checking uname version type: "#1 Tue Nov 1 12:34:56 UTC 2013" ... target device's version type
# current is host's version type.
#	@echo 'Target: $(TARGETID)'; \
#	 echo 'Target-Board: $(BOARD)'; \
#	 echo 'Target-Name: $(BOARDNAME)$(if $(SUBTARGETS),$(if $(SUBTARGET),))'; \
#	 echo 'Target-Path: $(subst $(TOPDIR)/,,$(PWD))'; \
#	 echo 'Target-Arch: $(ARCH)'; \
#	 echo 'Target-Arch-Packages: $(if $(ARCH_PACKAGES),$(ARCH_PACKAGES),$(BOARD))'; \
#	 echo 'Target-Features: $(FEATURES)'; \
#	 echo 'Target-Depends: $(DEPENDS)'; \
#	 echo 'CPU-Type: $(CPU_TYPE)$(if $(CPU_SUBTYPE),+$(CPU_SUBTYPE))'; \
#	 echo 'Linux-Version: $(LINUX_VERSION)'; \
#	 echo 'Linux-Kernel-Arch: $(LINUX_KARCH)'; 
####
# Checking uname version type: \"$(shell uname -v 2>&1)\"
# \nChecking uname machine type: \"$(ARCH)\"
####
#	HOSTCFLAGS="$(HOST_CFLAGS) -Wall -Wmissing-prototypes -Wstrict-prototypes" \
#	CROSS_COMPILE="$(KERNEL_CROSS)" \             <<<<<<<<<<<-------???
#	ARCH="$(LINUX_KARCH)" \                       <<<<<<<<<<<-------???
#	KBUILD_HAVE_NLS=no \
#	CONFIG_SHELL="$(BASH)" 
### https://wiki.python.org/moin/Python20FrequentlyAskedQuestions
# Q. I get an error in pyport.h: LONG_BIT definition appears wrong for platform (bad gcc config?). When I remove the #error directive it builds fine.
#A. You must be using Red Hat 7.0. It comes with a broken compiler. GCC 2.96 was never intended for distribution. You will need to update your glibc to version 2.2 (see http://www.redhat.com/support/errata/RHBA-2000-079.html for more information). I used the up2date command to install the new glibc.
###  python 2.7 STAGING_DIR_HOST pyport.h remove error
#//#if LONG_BIT != 8 * SIZEOF_LONG
#/* 04-Oct-2000 LONG_BIT is apparently (mis)defined as 64 on some recent
# * 32-bit platforms using gcc.  We try to catch that here at compile-time
# * rather than waiting for integer multiplication to trigger bogus
# * overflows.
# */
#//#error "LONG_BIT definition appears wrong for platform (bad gcc/glibc config?)."
#//#endif
#
#
###########
define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./cache/$(ARCH).txt $(PKG_BUILD_DIR)/cache.txt
	$(call Build/Prepare/Default)
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR); \
		echo -e >>cache.txt " \
			\nChecking uname release type: \"$(LINUX_VERSION)\" \
			\nChecking uname machine type: \"$(LINUX_KARCH)\" \
			\nChecking uname version type: \"#1 Tue Nov 1 12:34:56 UTC 2013\" \
			\nChecking uname sysname type: \"Linux\" \
			\n" ; \
		$(CONFIGURE_VARS) \
		./buildtools/bin/waf configure \
		$(SAMBA4_CONFIGURE_ARGS) \
	)
endef

define Package/samba4-server/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_BIN)/$(PKG_NAME)_multicall $(1)/usr/sbin
	$(LN) $(PKG_NAME)_multicall $(1)/usr/sbin/smbd
	$(LN) $(PKG_NAME)_multicall $(1)/usr/sbin/nmbd
	$(LN) $(PKG_NAME)_multicall $(1)/usr/sbin/smbpasswd
	$(INSTALL_DIR) $(1)/usr/bin
	$(LN) ../sbin/$(PKG_NAME)_multicall $(1)/usr/bin/smbcontrol
	$(LN) ../sbin/$(PKG_NAME)_multicall $(1)/usr/bin/smbtree
	$(LN) ../sbin/$(PKG_NAME)_multicall $(1)/usr/bin/smbstatus
	$(LN) ../sbin/$(PKG_NAME)_multicall $(1)/usr/bin/smbcquotas
	$(LN) ../sbin/$(PKG_NAME)_multicall $(1)/usr/bin/smbcacls
	$(LN) ../sbin/$(PKG_NAME)_multicall $(1)/usr/bin/nmblookup
	$(LN) ../sbin/$(PKG_NAME)_multicall $(1)/usr/bin/testparm
	$(INSTALL_DIR) $(1)/etc/samba
	$(LN) /var/etc/secrets.tdb $(1)/etc/samba/secrets.tdb
	$(LN) /var/etc/schannel_store.tdb $(1)/etc/samba/schannel_store.tdb
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) ./files/$(PKG_NAME).config $(1)/etc/config/$(PKG_NAME)
	$(INSTALL_DIR) $(1)/etc/samba
	$(INSTALL_DATA) ./files/smb.conf.template $(1)/etc/samba
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/codepages/lowcase.dat $(1)/etc/samba
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/codepages/upcase.dat $(1)/etc/samba
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/codepages/valid.dat $(1)/etc/samba
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/$(PKG_NAME).init $(1)/etc/init.d/$(PKG_NAME)
endef

define Package/samba4-server/conffiles
/etc/samba/smb.conf.template
endef

define Package/samba4-client/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_BIN)/smbclient $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_BIN)/nmblookup $(1)/usr/sbin
endef


$(eval $(call BuildPackage,$(PKG_NAME)-client))
$(eval $(call BuildPackage,$(PKG_NAME)-server))
