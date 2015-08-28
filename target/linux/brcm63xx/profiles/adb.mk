#
# Copyright (C) 2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

define Profile/A4001N
  NAME:=ADB P.DG A4001N
  PACKAGES:=kmod-b43 wpad-mini \
	kmod-usb2 kmod-usb-ohci
endef
define Profile/A4001N/Description
  Package set optimized for A4001N.
endef
$(eval $(call Profile,A4001N))

define Profile/A4001N1
  NAME:=ADB P.DG A4001N1
  PACKAGES:=kmod-b43 wpad-mini \
	kmod-usb2 kmod-usb-ohci
endef
define Profile/A4001N1/Description
  Package set optimized for A4001N1.
endef
$(eval $(call Profile,A4001N1))

define Profile/AV4202N
  NAME:=ADB P.DG AV4202N
  PACKAGES:=kmod-usb2 kmod-usb-ohci
endef
define Profile/AV4202N/Description
  Package set optimized for AV4202N.
endef
$(eval $(call Profile,AV4202N))
