#
# Copyright (C) 2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

define Profile/NETPROTECTION
	NAME:=Netprotection np-A105003201
	PACKAGES:=kmod-usb-ohci kmod-usb2
endef

define Profile/NETPROTECTION/Description
	Default package set for Netprotection np-A105003201
endef
$(eval $(call Profile,NETPROTECTION))
