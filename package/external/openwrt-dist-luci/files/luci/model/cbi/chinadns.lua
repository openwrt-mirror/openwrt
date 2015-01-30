--[[
openwrt-dist-luci: ChinaDNS
]]--

local m, s, o

if luci.sys.call("pidof chinadns >/dev/null") == 0 then
	m = Map("chinadns", translate("ChinaDNS"), translate("ChinaDNS is running"))
else
	m = Map("chinadns", translate("ChinaDNS"), translate("ChinaDNS is not running"))
end

s = m:section(TypedSection, "chinadns", translate("General Setting"))
s.anonymous = true

o = s:option(Flag, "enable", translate("Enable"))
o.rmempty = false

o = s:option(Flag, "compression",
	translate("Enable Compression Pointer"),
	translate("Using DNS compression pointer mutation, backlist and delaying would be disabled"))
o.rmempty = false

o = s:option(Flag, "bidirectional",
	translate("Enable Bidirectional Filter"),
	translate("Also filter results inside China from foreign DNS servers"))
o.rmempty = false

o = s:option(Value, "port", translate("Local Port"))
o.placeholder = 5353
o.default = 5353
o.datatype = "port"
o.rmempty = false

o = s:option(Value, "iplist", translate("Fake IP List"))
o.placeholder = "/etc/chinadns_iplist.txt"
o.default = "/etc/chinadns_iplist.txt"
o.datatype = "file"
o:depends("compression", "")

o = s:option(Value, "chnroute", translate("CHNRoute File"))
o.placeholder = "/etc/chinadns_chnroute.txt"
o.default = "/etc/chinadns_chnroute.txt"
o.datatype = "file"
o.rmempty = false

o = s:option(Value, "server",
	translate("Upstream Servers"),
	translate("Use commas to separate multiple ip address"))
o.placeholder = "114.114.114.114,208.67.222.222:443,8.8.8.8"
o.default = "114.114.114.114,208.67.222.222:443,8.8.8.8"
o.rmempty = false

o = s:option(Value, "result_delay",
	translate("Delay Time(sec)"),
	translate("Delay time for suspects, default: 0.3"))
o.placeholder = 0.3
o.default = 0.3
o.datatype = "ufloat"
o:depends("compression", "")

return m
