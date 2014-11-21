#
# Copyright (C) 2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

define Profile/HiWiFi-HC5761
 NAME:=HiWiFi HC5761
 PACKAGES:=\
   kmod-usb-core kmod-usb-dwc2 kmod-usb2 kmod-usb-storage  \
   kmod-mmc-spi kmod-sdhci kmod-sdhci-mt7620 \
   block-mount mountd kmod-fs-ext4 ppp-mod-pppoe e2fsprogs \
   kmod-ledtrig-usbdev fdisk
endef

define Profile/HiWiFi-HC5761/Description
 Default on SD cards and USB storage support.
endef
$(eval $(call Profile,HiWiFi-HC5761))
