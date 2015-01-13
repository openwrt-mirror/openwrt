#!/bin/sh

uci -q batch <<-EOF >/dev/null
	delete ucitrack.@shadowvpn[-1]
	add ucitrack shadowvpn
	set ucitrack.@shadowvpn[-1].init=shadowvpn
	commit ucitrack
EOF

rm -f /tmp/luci-indexcache
exit 0
