#
# Copyright (C) 2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

define Profile/AIBR100
	NAME:=Aigale Ai-BR100
	PACKAGES:=\
		kmod-usb-core kmod-usb-dwc2 \
		kmod-ledtrig-usbdev
endef

define Profile/AIBR100/Description
	Default package set for Aigale Ai-BR100.
endef
$(eval $(call Profile,AIBR100))
