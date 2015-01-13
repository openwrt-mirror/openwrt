--[[
openwrt-dist-luci: RedSocks2
]]--

module("luci.controller.redsocks2", package.seeall)

function index()
	if not nixio.fs.access("/etc/config/redsocks2") then
		return
	end

	entry({"admin", "services", "redsocks2"}, cbi("redsocks2"), _("RedSocks2"), 72).dependent = true
end
