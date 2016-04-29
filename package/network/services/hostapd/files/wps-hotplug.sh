#!/bin/sh
. /lib/functions/leds.sh

if [ "$ACTION" = "pressed" -a "$BUTTON" = "wps" ]; then
	cd /var/run/hostapd
	for socket in *; do
		[ -S "$socket" ] || continue
		[ "$(hostapd_cli -i "$socket" wps_pbc)" = "OK" ] && {
			WPS_LED=$(ls /sys/class/leds | grep -E 'qss|wps' | head -n 1)
			[ -z "$WPS_LED" ] || {
				led_timer $WPS_LED 300 300
				hostapd_cli -i "$socket" -P /var/run/hostapd-cli-wpsled-$socket.pid -a /lib/hostapd_wps_led.sh -B
			}
		}
	done
fi

return 0
