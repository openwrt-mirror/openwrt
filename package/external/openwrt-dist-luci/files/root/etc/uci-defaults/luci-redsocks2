#!/bin/sh

uci -q batch <<-EOF >/dev/null
	delete ucitrack.@redsocks2[-1]
	add ucitrack redsocks2
	set ucitrack.@redsocks2[-1].init=redsocks2
	commit ucitrack
EOF

rm -f /tmp/luci-indexcache
exit 0
