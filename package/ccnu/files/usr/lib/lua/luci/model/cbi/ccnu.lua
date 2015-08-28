--[[
Copyright 2013-2014 nanpuyue <nanpuyue@gmail.com>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

	http://www.apache.org/licenses/LICENSE-2.0
]]--

local uci = luci.model.uci.cursor()
require "luci.tools.webadmin"



m = Map("ccnu", "校园网",
	"<br>"..
	"①请在账户列表中填写您的学号和密码（身份证后六位）<br>"..
	"<a style='color:#E12345'>②完成后请点击两次保存按钮</a><br>"..
	"③在账号中选择您需要登入的账号<br>"..
	"④点击连接<br>"..
	"⑤如果连接失败，请查看登入信息")




control = m:section(TypedSection, "control", "全局设置".."&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;<input type=\"button\" value=\" " .. "登入信息" .. " \" onclick=\"window.open('../../../../info.html')\"/>")
control.anonymous = true

enabled = control:option(Flag, "enabled", "启用")

current = control:option(ListValue, "current", "帐号")
uci:foreach("ccnu", "userinfo",
	function (section)
		if section.username ~= nil then
			current:value(section.username)
		end
	end
)

iface = control:option(ListValue, "iface", "接口")
iface.default = "wan"
luci.tools.webadmin.cbi_add_networks(iface)

btn = control:option(Button, "_btn", "操作")

function disconnect()
	luci.sys.exec("SERVICE_DAEMONIZE=1 /etc/init.d/ccnu stop")
	btn.inputtitle = "连接"
	btn.inputstyle = "apply"
end

function connect()
	uci:commit("ccnu")
	luci.sys.exec("echo '<meta http-equiv=\"content-type\" content=\"text/html; charset=UTF-8\" />' > /www/info.html 2>&1")
	luci.sys.exec("/etc/init.d/ccnu start >> /www/info.html 2>&1")
	btn.inputtitle = "断开"
	btn.inputstyle = "reset"
end

function section_name(typename)
	local name
	uci:foreach("ccnu", typename,
		function (section)
			if section[".name"] ~= nil then
				name = section[".name"]
			end
		end
	)
	return name
end

if (luci.sys.call("pidof ccnu > /dev/null") == 0) then
	btn.inputtitle = "断开"
	btn.inputstyle = "reset"
else
	btn.inputtitle = "连接"
	btn.inputstyle = "apply"
end

local button_value = luci.http.formvalue("cbid.ccnu." .. section_name("control") .. "._btn")
if button_value == "断开" then
	disconnect()
elseif button_value == "连接" then
	connect()
end

userinfo = m:section(TypedSection, "userinfo", "账户列表")
userinfo.addremove = true
userinfo.anonymous = true
userinfo.template = "cbi/tblsection"

username = userinfo:option(Value, "username", "用户名")
username.placeholder = "用户名"

password = userinfo:option(Value, "password", "密码")
password.placeholder = "密码"
password.password = true

macaddr = userinfo:option(Value, "macaddr", "MAC地址")
macaddr.datetype = "macaddr"
macaddr.placeholder = "选填"

return m
