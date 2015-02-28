# this file will be included in 
# 	/lib/wifi/mt{chipname}.sh

repair_wireless_uci() {
	echo "repair_wireless_uci" >>/dev/null
	vifs=`uci show wireless | grep "=wifi-iface" | sed -n "s/=wifi-iface//gp"`
	echo $vifs >>/dev/null

	ifn5g=0
	ifn2g=0
	for vif in $vifs; do
		local netif nettype device netif_new
		echo  "<<<<<<<<<<<<<<<<<" >>/dev/null
		netif=`uci -q get ${vif}.ifname`
		nettype=`uci -q get ${vif}.network`
		device=`uci -q get ${vif}.device`
		if [ "$device" == "" ]; then
			echo "device cannot be empty!!" >>/dev/null
			return
		fi
		echo "device name $device!!" >>/dev/null
		echo "netif $netif" >>/dev/null
		echo "nettype $nettype" >>/dev/null
	
		case "$device" in
			mt7620 | mt7602 )
				netif_new="ra"${ifn2g}
				ifn2g=$(( $ifn2g + 1 ))
				;;
			mt7610 | mt7612 )
				netif_new="rai"${ifn5g}
				ifn5g=$(( $ifn5g + 1 ))
				;;
			* )
				echo "device $device not recognized!! " >>/dev/null
				;;
		esac					
	
		echo "ifn5g = ${ifn5g}, ifn2g = ${ifn2g}" >>/dev/null
		echo "netif_new = ${netif_new}" >>/dev/null
			
		if [ "$netif" == "" ]; then
			echo "ifname empty, we'll fix it with ${netif_new}" >>/dev/null
			uci -q set ${vif}.ifname=${netif_new}
		fi
		if [ "$nettype" == "" ]; then
			nettype="lan"
			echo "nettype empty, we'll fix it with ${nettype}" >>/dev/null
			uci -q set ${vif}.network=${nettype}
		fi
		echo  ">>>>>>>>>>>>>>>>>" >>/dev/null
    done
	uci changes >>/dev/null
	uci commit
}


sync_uci_with_dat() {
	echo "sync_uci_with_dat($1,$2,$3,$4)" >>/dev/null
	local device="$1"
	local datpath="$2"
	uci2dat -d $device -f $datpath > /tmp/uci2dat.log
}



# $1=device, $2=module
reinit_wifi() {
	echo "reinit_wifi($1,$2,$3,$4)" >>/dev/null
	local device="$1"
	local module="$2"
	config_get vifs "$device" vifs

	# shut down all vifs first
	for vif in $vifs; do
		config_get ifname $vif ifname
		ifconfig $ifname down
	done

	# in some case we have to reload drivers. (mbssid eg)
	ref=`cat /sys/module/$module/refcnt`
	if [ $ref != "0" ]; then
		# but for single driver, we only need to reload once.
		echo "$module ref=$ref, skip reload module" >>/tmp/wifi.log
	else
		echo "rmmod $module" >>/tmp/wifi.log
		rmmod $module
		echo "insmod $module" >>/tmp/wifi.log
		insmod $module
	fi

	# bring up vifs
	for vif in $vifs; do
		config_get ifname $vif ifname
		config_get disabled $vif disabled
		echo "ifconfig $ifname down" >>/dev/null
		if [ "$disabled" == "1" ]; then
			echo "$ifname marked disabled, skip" >>/dev/null
			continue
		else
			echo "ifconfig $ifname up" >>/dev/null
			ifconfig $ifname up
		fi
	done
}

prepare_ralink_wifi() {
	echo "prepare_ralink_wifi($1,$2,$3,$4)" >>/dev/null
	local device=$1
	config_get channel $device channel
	config_get ssid $2 ssid
	config_get mode $device mode
	config_get ht $device ht
	config_get country $device country
	config_get regdom $device regdom

	# HT40 mode can be enabled only in bgn (mode = 9), gn (mode = 7)
	# or n (mode = 6).
	HT=0
	[ "$mode" = 6 -o "$mode" = 7 -o "$mode" = 9 ] && [ "$ht" != "20" ] && HT=1

	# In HT40 mode, a second channel is used. If EXTCHA=0, the extra
	# channel is $channel + 4. If EXTCHA=1, the extra channel is
	# $channel - 4. If the channel is fixed to 1-4, we'll have to
	# use + 4, otherwise we can just use - 4.
	EXTCHA=0
	[ "$channel" != auto ] && [ "$channel" -lt "5" ] && EXTCHA=1
	
}

scan_ralink_wifi() {
	local device="$1"
	local module="$2"
	echo "scan_ralink_wifi($1,$2,$3,$4)" >>/dev/null
	repair_wireless_uci
	sync_uci_with_dat $device /etc/Wireless/$device/$device.dat
}

disable_ralink_wifi() {
	echo "disable_ralink_wifi($1,$2,$3,$4)" >>/dev/null
	local device="$1"
	config_get vifs "$device" vifs
	for vif in $vifs; do
		config_get ifname $vif ifname
		ifconfig $ifname down
	done

	# kill any running ap_clients
	killall ap_client || true
}

enable_ralink_wifi() {
	echo "enable_ralink_wifi($1,$2,$3,$4)" >>/dev/null
	local device="$1" dmode channel radio
	local module="$2"
	reinit_wifi $device $module
	config_get dmode $device mode
	config_get channel $device channel
	config_get radio $device radio
	config_get vifs "$device" vifs
#	config_get disabled "$device" disabled
#	[ "$disabled" == "1" ] && return
	for vif in $vifs; do
		local ifname encryption key ssid mode hidden
		config_get ifname $vif ifname
		[ "$radio" != "" ] && iwpriv $ifname set RadioOn=$radio
		config_get encryption $vif encryption
		config_get key $vif key
		config_get ssid $vif ssid
#		config_get wpa_crypto $vif wpa_crypto
		config_get hidden $vif hidden
		config_get mode $vif mode
		config_get wps $vif wps
		config_get isolate $vif isolate
		config_get disabled $vif disabled
		if [ "$disabled" == "1" ]; then
			continue
		else
			ifconfig $ifname up
		fi

		# Skip this interface if no SSID was configured
		[ "$ssid" -a "$ssid" != "off" ] || continue


##RTWIFI STA function from PandoraBox
		#STA APClient配置
		[ "$mode" == "sta" ] && {
					#如果为apcli模式，指定接口名称为apcli0
					ifname="apcli0"
					echo "#Encryption" >/tmp/wifi_encryption_${ifname}.dat
					ifconfig $ifname down
					iwpriv $ifname set ApCliEnable=0 
					iwpriv $ifname set ApCliSsid=$ssid
					config_get bssid $vif bssid 0
					[ -z "$mode" ] && {
					iwpriv $ifname set ApCliBssid=$bssid
					echo "APCli use bssid connect."
					}
			case "$encryption" in
				none)
					echo "NONE" >>/tmp/wifi_encryption_${ifname}.dat
					iwpriv $ifname set ApCliAuthMode=OPEN 
					iwpriv $ifname set ApCliEncrypType=NONE 
					;;
				WEP|wep|wep-open)
					echo "WEP" >>/tmp/wifi_encryption_${ifname}.dat
					iwpriv $ifname set AuthMode=WEPAUTO
					iwpriv $ifname set ApCliEncrypType=WEP
					iwpriv $ifname set Key0=${key}
					;;
				WEP-SHARE|wep-shared)
					echo "WEP" >>/tmp/wifi_encryption_${ifname}.dat
					iwpriv $ifname set AuthMode=WEPAUTO
					iwpriv $ifname set ApCliEncrypType=WEP
					iwpriv $ifname set Key0=${key}
					;;
				WPA*|wpa*|WPA2-PSK|psk*)
					echo "WPA2" >>/tmp/wifi_encryption_${ifname}.dat
					iwpriv $ifname set ApCliAuthMode=WPAPSKWPA2PSK
					iwpriv $ifname set ApCliEncrypType=AES
					iwpriv $ifname set ApCliWPAPSK=$key
					echo "WPAPSKWPA2PSK" >>/tmp/wifi_encryption_${ifname}.dat
					echo "TKIPAES" >>/tmp/wifi_encryption_${ifname}.dat
					;;
			esac
					iwpriv $ifname set ApCliEnable=1
					ifconfig $ifname up
		}
#		[ "$mode" == "sta" ] && {
#			case "$encryption" in
#				WEP|wep)
					# $key contains the key index,
					# so lookup the actual key to
					# use
#					config_get key $vif "key$key"
#					;;
#			esac
#			ap_client "$ssid" "$key" >/dev/null 2>/dev/null </dev/null &
#		}
		[ "$mode" == "sta" ] || {
			[ "$dmode" == "6" ] && wpa_crypto="aes"
			[ "$channel" != auto ] && iwpriv $ifname set Channel=$channel
			ifconfig $ifname up
			case "$encryption" in
				psk*|wpa*|WPA*|Mixed|mixed)
					local enc="OPEN"
					local crypto="NONE"
					case "$encryption" in
					    psk-mixed*) enc=WPAPSKWPA2PSK crypto=AES;;
					    psk2*) enc=WPA2PSK crypto=TKIPAES;;
					    psk*) enc=WPAPSK crypto=TKIP;;
					    wpa-mixed*) enc=WPAWPA2 crypto=TKIPAES;;
					    wpa2*) enc=WPA2 crypto=TKIPAES;;
					    wpa*) enc=WPA crypto=TKIPAES;;
					esac
					case "$encryption" in
					    *tkip+ccmp) crypto=TKIPAES;;
					    *tkip) crypto=TKIP;;
					    *ccmp) crypto=AES;;
					esac
					iwpriv $ifname set AuthMode=$enc
					iwpriv $ifname set EncrypType=$crypto
					iwpriv $ifname set IEEE8021X=0
					iwpriv $ifname set "WPAPSK=${key}"
#					iwpriv $ifname set DefaultKeyID=2
					iwpriv $ifname set "SSID=${ssid}"
#					if [ "$wps" == "1" ]; then
#						iwpriv $ifname set WscConfMode=7
#					else
#						iwpriv $ifname set WscConfMode=0
#					fi
					;;
				WEP*|wep*)
					local enc="OPEN"
					local crypto="WEP"
					case "$encryption" in
					    *open) enc=OPEN;;
					    *shared) enc=SHARED;;
					esac
					iwpriv $ifname set AuthMode=$enc
					iwpriv $ifname set EncrypType=$crypto
					for idx in 1 2 3 4; do
						config_get keyn $vif key${idx}
						# openwrt add prefix "s:" to wep key to indicate ASCII mode
						keyn=${keyn#*s:}
						[ -n "$keyn" ] && iwpriv $ifname set "Key${idx}=${keyn}"
					done
					iwpriv $ifname set DefaultKeyID=${key}
					iwpriv $ifname set "SSID=${ssid}"
					iwpriv $ifname set WscConfMode=0
					iwpriv $ifname set WscModeOption=0
					;;
				none|open)
					iwpriv $ifname set AuthMode=OPEN
					iwpriv $ifname set EncrypType=NONE
					iwpriv $ifname set WscConfMode=0
					;;
			esac
		}

		local net_cfg bridge
		net_cfg="$(find_net_config "$vif")"
		[ -z "$net_cfg" ] || {
			bridge="$(bridge_interface "$net_cfg")"
			config_set "$vif" bridge "$bridge"
			start_net "$ifname" "$net_cfg"
		}

		# If isolation is requested, disable forwarding between
		# wireless clients (both within the same BSSID and
		# between BSSID's, though the latter is probably not
		# relevant for our setup).
		iwpriv $ifname set NoForwarding="${isolate:-0}"
		iwpriv $ifname set NoForwardingBTNBSSID="${isolate:-0}"

		set_wifi_up "$vif" "$ifname"
	done
}

detect_ralink_wifi() {
	echo "detect_ralink_wifi($1,$2,$3,$4)" >>/dev/null
	local channel
	local device="$1"
	local module="$2"
	local ifname
	cd /sys/module/
	[ -d $module ] || return
	config_get channel $device channel
	[ -z "$channel" ] || return
	case "$device" in
		mt7620 | mt7602 )
			ifname="ra0"
			;;
		mt7610 | mt7612 )
			ifname="rai0"
			;;
		* )
			echo "device $device not recognized!! " >>/dev/null
			;;
	esac					
	cat <<EOF
config wifi-device	$device
	option type     $device
	option vendor   ralink
	option channel  0
	option autoch   2

config wifi-iface
	option device   $device
	option ifname	$ifname
	option network  lan
	option mode     ap
	option ssid OpenWrt-$device
	option encryption psk2
	option key      12345678

EOF
}



