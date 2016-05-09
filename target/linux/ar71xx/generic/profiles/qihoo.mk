#
# Copyright (C) 2013 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

define Profile/QIHOOC301
	NAME:=Qihoo 360 C301
	PACKAGES:=kmod-ath9k kmod-ath10k kmod-usb2
endef

define Profile/QIHOOC301/Description
	Package set optimized for the Qihoo 360 C301.
endef

$(eval $(call Profile,QIHOOC301))
