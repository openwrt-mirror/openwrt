--[[
openwrt-dist-luci: ShadowVPN
]]--

module("luci.controller.shadowvpn", package.seeall)

function index()
	if not nixio.fs.access("/etc/config/shadowvpn") then
		return
	end

	entry({"admin", "services", "shadowvpn"}, cbi("shadowvpn"), _("ShadowVPN"), 76).dependent = true
end
