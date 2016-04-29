#!/bin/sh
#
# Copyright (c) 2016 GuoGuo <gch981213@gmail.com>
#

. /lib/functions/leds.sh

IFNAME=$1
CMD=$2
WPS_LED=$(ls /sys/class/leds | grep -E 'qss|wps' | head -n 1)
[ -z "$WPS_LED" ] && {
	kill "$(cat "/var/run/hostapd-cli-wpsled-$IFNAME.pid")"
	exit
}

case "$CMD" in
	WPS-PBC-ACTIVE)
		led_timer $WPS_LED 300 300
		;;
	CTRL-EVENT-EAP-STARTED)
		led_timer $WPS_LED 120 120
		;;
	WPS-TIMEOUT|WPS-SUCCESS|DISCONNECTED)
		led_off $WPS_LED
		kill "$(cat "/var/run/hostapd-cli-wpsled-$IFNAME.pid")"
		;;
esac
