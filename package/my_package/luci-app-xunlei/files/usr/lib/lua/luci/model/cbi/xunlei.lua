local fs = require "nixio.fs"
local util = require "nixio.util"

local running=(luci.sys.call("pidof EmbedThunderManager > /dev/null") == 0)
local button=""
local xunleiinfo=""
local tblXLInfo={}
local detailInfo = "<br />启动后会看到类似如下信息：<br /><br />[ 0, 1, 1, 0, “7DHS94”,1, “201_2.1.3.121”, “shdixang”, 1 ]<br /><br />其中有用的几项为：<br /><br />第一项： 0表示返回结果成功；<br /><br />第二项： 1表示检测网络正常，0表示检测网络异常；<br /><br />第四项： 1表示已绑定成功，0表示未绑定；<br /><br />第五项： 未绑定的情况下，为绑定的需要的激活码；<br /><br />第六项： 1表示磁盘挂载检测成功，0表示磁盘挂载检测失败。"

if running then
	xunleiinfo = luci.sys.exec("wget http://localhost:9000/getsysinfo -O - 2>/dev/null")
	--upinfo = luci.sys.exec("wget -qO- http://dl.lazyzhu.com/file/Thunder/Xware/latest 2>/dev/null")
        button = "&nbsp;&nbsp;&nbsp;&nbsp;" .. translate("运行状态：") .. xunleiinfo	
	m = Map("xunlei", translate("Xware"), translate("迅雷远程下载 正在运行...") .. button)
	string.gsub(string.sub(xunleiinfo, 2, -2),'[^,]+',function(w) table.insert(tblXLInfo, w) end)
	
	detailInfo = [[<p>启动信息：]] .. xunleiinfo .. [[</p>]]
	if tonumber(tblXLInfo[1]) == 0 then
	  detailInfo = detailInfo .. [[<p>状态正常</p>]]
	else
	  detailInfo = detailInfo .. [[<p style="color:red">执行异常</p>]]
	end
	
	if tonumber(tblXLInfo[2]) == 0 then
	  detailInfo = detailInfo .. [[<p style="color:red">网络异常</p>]]
	else
	  detailInfo = detailInfo .. [[<p>网络正常</p>]]
	end
	
	if tonumber(tblXLInfo[4]) == 0 then
	  detailInfo = detailInfo .. [[<p>未绑定]].. [[&nbsp;&nbsp;激活码：]].. tblXLInfo[5] ..[[</p>]]	  
	else
	  detailInfo = detailInfo .. [[<p>已绑定</p>]]
	end

	if tonumber(tblXLInfo[6]) == 0 then
	  detailInfo = detailInfo .. [[<p style="color:red">磁盘挂载检测失败</p>]]
	else
	  detailInfo = detailInfo .. [[<p>磁盘挂载检测成功</p>]]
	end	
else
	m = Map("xunlei", translate("Xware"), translate("[迅雷远程下载 尚未启动]"))
end

-----------
--Xware--
-----------

s = m:section(TypedSection, "xunlei", translate("Xware 设置"))
s.anonymous = true

s:tab("basic",  translate("Settings"))

enable = s:taboption("basic", Flag, "enable", translate("启用 迅雷远程下载"))
enable.rmempty = false

local devices = {}
util.consume((fs.glob("/mnt/sd??*")), devices)

device = s:taboption("basic", Value, "device", translate("挂载点"), translate("<br />迅雷程序下载目录所在的“挂载点”。"))
for i, dev in ipairs(devices) do
	device:value(dev)
end
if nixio.fs.access("/etc/config/xunlei") then
        device.titleref = luci.dispatcher.build_url("admin", "system", "fstab")
end

file = s:taboption("basic", Value, "file", translate("迅雷程序安装路径"), translate("<br />迅雷程序安装路径，例如：/mnt/sda1，将会安装在/mnt/sda1/xunlei 下。"))
for i, dev in ipairs(devices) do
	file:value(dev)
end

upinfo = luci.sys.exec("cat /tmp/etc/xlver")

op = s:taboption("basic", Button, "upxlast", translate("查看更新."),translate("<strong><font color=\"red\">当前最新版：</font></strong>") .. upinfo)
op.inputstyle = "apply"

op.write = function(self, section)
	opstatus = (luci.sys.exec("/etc/xware/xlatest" %{ self.option }) == 0)
	if  opstatus then
	self.inputstyle = "apply"
	end
luci.model.uci.cursor()
end

up = s:taboption("basic", Flag, "up", translate("升级迅雷远程下载"), translate("<script type=\"text/javascript\"></script><input type=\"button\" class=\"cbi-button cbi-button-apply\" value=\"查看更新.\" onclick=\"window.open('http://dl.lazyzhu.com/file/Thunder/Xware/latest')\" />"))
up.rmempty = false

zurl = s:taboption("basic", Value, "url", translate("地址"), translate("自定义迅雷远程下载地址。默认：http://dl.lazyzhu.com/file/Thunder/Xware"))
zurl.rmempty = false
zurl:value("http://dl.lazyzhu.com/file/Thunder/Xware")

zversion = s:taboption("basic", Flag, "zversion", translate("自定义版本"), translate("自定义迅雷远程下载版本。"))
zversion.rmempty = false
zversion:depends("up",1)

ver = s:taboption("basic", Value, "ver", translate("版本号"), translate("自定义迅雷远程下载版本号。"))
ver:depends("zversion",1)
ver:value("1.0.11")
ver:value("1.0.27")
ver:value("1.0.28")
ver:value("1.0.29")
ver:value("1.0.30")

vod = s:taboption("basic", Flag, "vod", translate("删除迅雷VOD服务器"), translate("删除迅雷VOD服务器。"))
vod.rmempty = false

xwareup = s:taboption("basic", Value, "xware", translate("Xware 程序版本："),translate("<br />ar71xx系列的选择默认版本，其他型号的路由根据CPU选择。"))
xwareup.rmempty = false
xwareup:value("Xware_mipseb_32_uclibc.tar.gz", translate("Xware_mipseb_32_uclibc.tar.gz"))
xwareup:value("Xware_mipsel_32_uclibc.tar.gz", translate("Xware_mipsel_32_uclibc.tar.gz"))
xwareup:value("Xware_x86_32_glibc.tar.gz", translate("Xware_x86_32_glibc.tar.gz"))
xwareup:value("Xware_x86_32_uclibc.tar.gz", translate("Xware_x86_32_uclibc.tar.gz"))
xwareup:value("Xware_pogoplug.tar.gz", translate("Xware_pogoplug.tar.gz"))
xwareup:value("Xware_armeb_v6j_uclibc.tar.gz", translate("Xware_armeb_v6j_uclibc.tar.gz"))
xwareup:value("Xware_armeb_v7a_uclibc.tar.gz", translate("Xware_armeb_v7a_uclibc.tar.gz"))
xwareup:value("Xware_armel_v5t_uclibc.tar.gz", translate("Xware_armel_v5t_uclibc.tar.gz"))
xwareup:value("Xware_armel_v5te_android.tar.gz", translate("Xware_armel_v5te_android.tar.gz"))
xwareup:value("Xware_armel_v5te_glibc.tar.gz", translate("Xware_armel_v5te_glibc.tar.gz"))
xwareup:value("Xware_armel_v6j_uclibc.tar.gz", translate("Xware_armel_v6j_uclibc.tar.gz"))
xwareup:value("Xware_armel_v7a_uclibc.tar.gz", translate("Xware_armel_v7a_uclibc.tar.gz"))
xwareup:value("Xware_asus_rt_ac56u.tar.gz", translate("Xware_asus_rt_ac56u.tar.gz"))
xwareup:value("Xware_cubieboard.tar.gz", translate("Xware_cubieboard.tar.gz"))
xwareup:value("Xware_iomega_cloud.tar.gz", translate("Xware_iomega_cloud.tar.gz"))
xwareup:value("Xware_my_book_live.tar.gz", translate("Xware_my_book_live.tar.gz"))
xwareup:value("Xware_netgear_6300v2.tar.gz", translate("Xware_netgear_6300v2.tar.gz"))

s:taboption("basic", DummyValue,"opennewwindow" ,translate("<br /><p align=\"justify\"><script type=\"text/javascript\"></script><input type=\"button\" class=\"cbi-button cbi-button-apply\" value=\"获取启动信息\" onclick=\"window.open('http://'+window.location.host+':9000/getsysinfo')\" /></p>"), detailInfo)


s:taboption("basic", DummyValue,"opennewwindow" ,translate("<br /><p align=\"justify\"><script type=\"text/javascript\"></script><input type=\"button\" class=\"cbi-button cbi-button-apply\" value=\"迅雷远程下载页面\" onclick=\"window.open('http://yuancheng.xunlei.com')\" /></p>"), translate("将激活码填进网页即可绑定。"))

s:taboption("basic", DummyValue,"opennewwindow" ,translate("<br /><p align=\"justify\"><script type=\"text/javascript\"></script><input type=\"button\" class=\"cbi-button cbi-button-apply\" value=\"迅雷论坛\" onclick=\"window.open('http://luyou.xunlei.com/forum-51-1.html')\" /></p>"))

s:tab("editconf_mounts", translate("挂载点配置"))
editconf_mounts = s:taboption("editconf_mounts", Value, "_editconf_mounts", 
	translate("挂载点配置(一般情况下只需填写你的挂载点目录即可)"), 
	translate("Comment Using #"))
editconf_mounts.template = "cbi/tvalue"
editconf_mounts.rows = 20
editconf_mounts.wrap = "off"

function editconf_mounts.cfgvalue(self, section)

	return fs.readfile("/tmp/etc/thunder_mounts.cfg") or ""
end
function editconf_mounts.write(self, section, value1)
	if value1 then
		value1 = value1:gsub("\r\n?", "\n")
		fs.writefile("/tmp/thunder_mounts.cfg", value1)
		if (luci.sys.call("cmp -s /tmp/thunder_mounts.cfg /tmp/etc/thunder_mounts.cfg") == 1) then
			fs.writefile("/tmp/etc/thunder_mounts.cfg", value1)
		end
		fs.remove("/tmp/thunder_mounts.cfg")
	end
end

s:tab("editconf_etm", translate("Xware 配置"))
editconf_etm = s:taboption("editconf_etm", Value, "_editconf_etm", 
	translate("Xware 配置："), 
	translate("注释用“ ; ”"))
editconf_etm.template = "cbi/tvalue"
editconf_etm.rows = 20
editconf_etm.wrap = "off"

function editconf_etm.cfgvalue(self, section)
	return fs.readfile("/tmp/etc/etm.cfg") or ""
end
function editconf_etm.write(self, section, value2)
	if value2 then
		value2 = value2:gsub("\r\n?", "\n")
		fs.writefile("/tmp/etm.cfg", value2)
		if (luci.sys.call("cmp -s /tmp/etm.cfg /tmp/etc/etm.cfg") == 1) then
			fs.writefile("/tmp/etc/etm.cfg", value2)
		end
		fs.remove("/tmp/etm.cfg")
	end
end

s:tab("editconf_download", translate("下载配置"))
editconf_download = s:taboption("editconf_download", Value, "_editconf_download", 
	translate("下载配置"), 
	translate("注释用“ ; ”"))
editconf_download.template = "cbi/tvalue"
editconf_download.rows = 20
editconf_download.wrap = "off"

function editconf_download.cfgvalue(self, section)
	return fs.readfile("/tmp/etc/download.cfg") or ""
end
function editconf_download.write(self, section, value3)
	if value3 then
		value3 = value3:gsub("\r\n?", "\n")
		fs.writefile("/tmp/download.cfg", value3)
		if (luci.sys.call("cmp -s /tmp/download.cfg /tmp/etc/download.cfg") == 1) then
			fs.writefile("/tmp/etc/download.cfg", value3)
		end
		fs.remove("/tmp/download.cfg")
	end
end
return m
