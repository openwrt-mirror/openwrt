define Profile/EASY80920NOR
  NAME:=Lantiq VR9 - EASY80920NOR
  PACKAGES:=kmod-ath9k wpad-mini kmod-usb-dwc2
endef

$(eval $(call Profile,EASY80920NOR))

define Profile/EASY80920NAND
  NAME:=Lantiq VR9 - EASY80920NAND
  PACKAGES:=kmod-ath9k wpad-mini kmod-usb-dwc2
endef

$(eval $(call Profile,EASY80920NAND))

define Profile/VGV953
  NAME:=Lantiq VR9 - SPEEDPORT W921V
  PACKAGES:=wpad-mini kmod-usb-dwc2
endef

VGV953_UBIFS_OPTS:="-m 512 -e 15872 -c 2048"
VGV953_UBI_OPTS:="-m 512 -p 16KiB -s 256"

$(eval $(call Profile,VGV953))
