#!/bin/sh
. /lib/functions/leds.sh

WPS_LED=$(ls /sys/class/leds | grep -E 'qss|wps' | head -n 1)

if [ "$ACTION" = "pressed" -a "$BUTTON" = "wps" ]; then
	[ -z $WPS_LED ] || led_timer $WPS_LED 150 150
	cd /var/run/hostapd
	for socket in *; do
		[ -S "$socket" ] || continue
		hostapd_cli -i "$socket" wps_pbc
	done
	sleep 1
	[ -z $WPS_LED ] || led_off $WPS_LED
fi

