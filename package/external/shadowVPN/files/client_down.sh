#!/bin/sh

# This script will be executed when client is down.
# All key value pairs in ShadowVPN config file will be passed to this script
# as environment variables, except password.

PID=$(cat $pidfile 2>/dev/null)
loger() {
	echo "$(date '+%c') down.$1 ShadowVPN[$PID] $2"
}

# Get original gateway
loger info "Get the original default gateway"
gateway=$(ip route show 0/0 | grep via | grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}')
route_mode=$(cat /tmp/shadowvpn/route_mode 2>/dev/null)

# Turn off NAT over VPN
loger notice "Turn off NAT over $intf"
iptables -t nat -D POSTROUTING -o $intf -j MASQUERADE
iptables -D FORWARD -o $intf -j ACCEPT
iptables -D FORWARD -i $intf -j ACCEPT

# Change routing table
ip route del $server
if [ "$route_mode" != 2 ]; then
	ip route del 0.0.0.0/1
	ip route del 128.0.0.0/1
	loger notice "Default route changed to original route"
fi

# Remove route rules
if [ -f /tmp/shadowvpn/routes ]; then
	sed -e "s/^/route del /" /tmp/shadowvpn/routes |\
	ip -batch -
	loger notice "Route rules have been removed"
fi

rm -rf /tmp/shadowvpn

loger info "Script $0 completed"
