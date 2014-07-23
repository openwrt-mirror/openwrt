Source-Makefile: feeds/telephony/net/kamailio-1.5.x/Makefile
Package: kamailio
Menu: 1
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread 
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: Mature and flexible open source SIP server, v1.5.x
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: Mature and flexible open source SIP server, v1.5.x
http://www.kamailio.org/

@@

Package: kamailio-example
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio +kamailio-mod-acc +kamailio-mod-maxfwd +kamailio-mod-mi-fifo +kamailio-mod-pv +kamailio-mod-registrar +kamailio-mod-rr +kamailio-mod-sl +kamailio-mod-siputils +kamailio-mod-textops +kamailio-mod-tm +kamailio-mod-uri-db +kamailio-mod-usrloc +kamailio-mod-xlog
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: Kamailio example config
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: Kamailio example config
http://www.kamailio.org/

@@

Package: kamailio-tools
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: Kamailio control tools
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: Kamailio control tools
http://www.kamailio.org/

@@

Package: kamailio-mod-acc
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio +kamailio-mod-tm
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio Accounting module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio Accounting module
http://www.kamailio.org/

@@

Package: kamailio-mod-alias-db
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio Database-backend aliases module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio Database-backend aliases module
http://www.kamailio.org/

@@

Package: kamailio-mod-auth
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio Authentication Framework module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio Authentication Framework module
http://www.kamailio.org/

@@

Package: kamailio-mod-auth-db
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio +kamailio-mod-auth
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio Database-backend authentication module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio Database-backend authentication module
http://www.kamailio.org/

@@

Package: kamailio-mod-auth-radius
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio +kamailio-mod-auth +libradiusclient-ng
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio RADIUS-backend authentication module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio RADIUS-backend authentication module
http://www.kamailio.org/

@@

Package: kamailio-mod-avpops
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio AVP operation module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio AVP operation module
http://www.kamailio.org/

@@

Package: kamailio-mod-benchmark
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio Config benchmark module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio Config benchmark module
http://www.kamailio.org/

@@

Package: kamailio-mod-cfgutils
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio Config utilities module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio Config utilities module
http://www.kamailio.org/

@@

Package: kamailio-mod-cpl-c
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio +kamailio-mod-tm +kamailio-mod-sl +kamailio-mod-usrloc +libxml2
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio Call Processing language interpreter module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio Call Processing language interpreter module
http://www.kamailio.org/

@@

Package: kamailio-mod-db-flatstore
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio Fast writing-only text database-backed module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio Fast writing-only text database-backed module
http://www.kamailio.org/

@@

Package: kamailio-mod-db-mysql
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio +libmysqlclient
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio MySQL database-backend module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio MySQL database-backend module
http://www.kamailio.org/

@@

Package: kamailio-mod-db-postgres
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio +libpq
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio PostgreSQL Database-backend module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio PostgreSQL Database-backend module
http://www.kamailio.org/

@@

Package: kamailio-mod-db-text
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio Text database-backend module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio Text database-backend module
http://www.kamailio.org/

@@

Package: kamailio-mod-dialog
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio +kamailio-mod-rr +kamailio-mod-tm
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio Dialog support module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio Dialog support module
http://www.kamailio.org/

@@

Package: kamailio-mod-dialplan
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio +libpcre
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio Dialplan management module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio Dialplan management module
http://www.kamailio.org/

@@

Package: kamailio-mod-dispatcher
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio Dispatcher module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio Dispatcher module
http://www.kamailio.org/

@@

Package: kamailio-mod-diversion
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio Diversion header insertion module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio Diversion header insertion module
http://www.kamailio.org/

@@

Package: kamailio-mod-domain
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio Multi-domain support module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio Multi-domain support module
http://www.kamailio.org/

@@

Package: kamailio-mod-domainpolicy
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio Domain policy module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio Domain policy module
http://www.kamailio.org/

@@

Package: kamailio-mod-enum
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio ENUM lookup module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio ENUM lookup module
http://www.kamailio.org/

@@

Package: kamailio-mod-exec
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio External exec module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio External exec module
http://www.kamailio.org/

@@

Package: kamailio-mod-group
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio Database-backend user-groups module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio Database-backend user-groups module
http://www.kamailio.org/

@@

Package: kamailio-mod-h350
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio +kamailio-mod-ldap +libopenldap
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio H.350 module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio H.350 module
http://www.kamailio.org/

@@

Package: kamailio-mod-htable
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio Hash Table module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio Hash Table module
http://www.kamailio.org/

@@

Package: kamailio-mod-imc
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio +kamailio-mod-db-mysql +kamailio-mod-tm
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio IM conferencing module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio IM conferencing module
http://www.kamailio.org/

@@

Package: kamailio-mod-jabber
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio +kamailio-mod-tm +libexpat
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio Jabber module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio Jabber module
http://www.kamailio.org/

@@

Package: kamailio-mod-lcr
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio +kamailio-mod-tm +libpcre
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio Least Cost Routing module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio Least Cost Routing module
http://www.kamailio.org/

@@

Package: kamailio-mod-ldap
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio +libopenldap
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio LDAP connector module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio LDAP connector module
http://www.kamailio.org/

@@

Package: kamailio-mod-maxfwd
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio Max-Forward processor module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio Max-Forward processor module
http://www.kamailio.org/

@@

Package: kamailio-mod-mi-datagram
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio Datagram support for Management Interface module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio Datagram support for Management Interface module
http://www.kamailio.org/

@@

Package: kamailio-mod-mi-fifo
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio FIFO support for Management Interface module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio FIFO support for Management Interface module
http://www.kamailio.org/

@@

Package: kamailio-mod-misc_radius
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio +libradiusclient-ng
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio Generic RADIUS module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio Generic RADIUS module
http://www.kamailio.org/

@@

Package: kamailio-mod-msilo
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio +kamailio-mod-tm
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio SIP message silo module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio SIP message silo module
http://www.kamailio.org/

@@

Package: kamailio-mod-nat_traversal
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio +kamailio-mod-dialog +kamailio-mod-sl +kamailio-mod-tm
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio NAT traversal module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio NAT traversal module
http://www.kamailio.org/

@@

Package: kamailio-mod-nathelper
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio +rtpproxy
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio NAT traversal helper module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio NAT traversal helper module
http://www.kamailio.org/

@@

Package: kamailio-mod-path
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio +kamailio-mod-rr
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio SIP path insertion module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio SIP path insertion module
http://www.kamailio.org/

@@

Package: kamailio-mod-pdt
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio Prefix-to-Domain translator module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio Prefix-to-Domain translator module
http://www.kamailio.org/

@@

Package: kamailio-mod-peering
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio +libradiusclient-ng
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio Perring module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio Perring module
http://www.kamailio.org/

@@

Package: kamailio-mod-permissions
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio Permissions control module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio Permissions control module
http://www.kamailio.org/

@@

Package: kamailio-mod-pike
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio Flood detector module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio Flood detector module
http://www.kamailio.org/

@@

Package: kamailio-mod-presence
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio +kamailio-mod-sl +kamailio-mod-tm +libxml2
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio Presence server module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio Presence server module
http://www.kamailio.org/

@@

Package: kamailio-mod-presence-dialoginfo
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio +kamailio-mod-presence
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio Dialog Event presence module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio Dialog Event presence module
http://www.kamailio.org/

@@

Package: kamailio-mod-presence-mwi
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio +kamailio-mod-presence
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio Message Waiting Indication presence module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio Message Waiting Indication presence module
http://www.kamailio.org/

@@

Package: kamailio-mod-presence-xml
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio +kamailio-mod-presence +kamailio-mod-xcap-client
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio XCAP presence module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio XCAP presence module
http://www.kamailio.org/

@@

Package: kamailio-mod-pua
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio +kamailio-mod-tm +libxml2
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio Presence User Agent module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio Presence User Agent module
http://www.kamailio.org/

@@

Package: kamailio-mod-pua-bla
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio +kamailio-mod-presence +kamailio-mod-pua +kamailio-mod-usrloc
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio Bridged Line Appearence PUA module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio Bridged Line Appearence PUA module
http://www.kamailio.org/

@@

Package: kamailio-mod-pua-dialoginfo
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio +kamailio-mod-dialog +kamailio-mod-pua
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio Dialog Event PUA module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio Dialog Event PUA module
http://www.kamailio.org/

@@

Package: kamailio-mod-pua-mi
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio +kamailio-mod-pua
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio PUA Management Interface module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio PUA Management Interface module
http://www.kamailio.org/

@@

Package: kamailio-mod-pua-usrloc
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio +kamailio-mod-pua +kamailio-mod-usrloc
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio PUA User Location module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio PUA User Location module
http://www.kamailio.org/

@@

Package: kamailio-mod-pua-xmpp
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio +kamailio-mod-presence +kamailio-mod-pua +kamailio-mod-xmpp
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio PUA XMPP module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio PUA XMPP module
http://www.kamailio.org/

@@

Package: kamailio-mod-pv
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio Pseudo-Variables module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio Pseudo-Variables module
http://www.kamailio.org/

@@

Package: kamailio-mod-qos
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio +kamailio-mod-dialog
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio QoS control module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio QoS control module
http://www.kamailio.org/

@@

Package: kamailio-mod-ratelimit
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio Traffic shapping module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio Traffic shapping module
http://www.kamailio.org/

@@

Package: kamailio-mod-regex
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio +libpcre
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio Regular Expression module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio Regular Expression module
http://www.kamailio.org/

@@

Package: kamailio-mod-registrar
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio +kamailio-mod-usrloc
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio SIP Registrar module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio SIP Registrar module
http://www.kamailio.org/

@@

Package: kamailio-mod-rls
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio +kamailio-mod-presence +kamailio-mod-pua +kamailio-mod-tm +libxml2
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio Resource List Server module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio Resource List Server module
http://www.kamailio.org/

@@

Package: kamailio-mod-rr
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio Record-Route and Route module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio Record-Route and Route module
http://www.kamailio.org/

@@

Package: kamailio-mod-rtimer
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio Routing Timer module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio Routing Timer module
http://www.kamailio.org/

@@

Package: kamailio-mod-sanity
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio +kamailio-mod-sl
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio SIP sanity checks module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio SIP sanity checks module
http://www.kamailio.org/

@@

Package: kamailio-mod-siptrace
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio SIP trace module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio SIP trace module
http://www.kamailio.org/

@@

Package: kamailio-mod-siputils
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio +kamailio-mod-sl
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio SIP utilities module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio SIP utilities module
http://www.kamailio.org/

@@

Package: kamailio-mod-sl
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio Stateless replier module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio Stateless replier module
http://www.kamailio.org/

@@

Package: kamailio-mod-sms
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio +kamailio-mod-tm
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio SIP-to-SMS IM gateway module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio SIP-to-SMS IM gateway module
http://www.kamailio.org/

@@

Package: kamailio-mod-speeddial
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio Per-user speed-dial controller module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio Per-user speed-dial controller module
http://www.kamailio.org/

@@

Package: kamailio-mod-sqlops
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio SQL operations module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio SQL operations module
http://www.kamailio.org/

@@

Package: kamailio-mod-statistics
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio Script statistics module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio Script statistics module
http://www.kamailio.org/

@@

Package: kamailio-mod-sst
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio +kamailio-mod-dialog +kamailio-mod-sl
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio SIP Session Timer module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio SIP Session Timer module
http://www.kamailio.org/

@@

Package: kamailio-mod-textops
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio Text operations module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio Text operations module
http://www.kamailio.org/

@@

Package: kamailio-mod-tlsops
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio +libopenssl
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio TLS operations module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio TLS operations module
http://www.kamailio.org/

@@

Package: kamailio-mod-tm
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio Transaction module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio Transaction module
http://www.kamailio.org/

@@

Package: kamailio-mod-uac
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio +kamailio-mod-tm
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio User Agent Client module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio User Agent Client module
http://www.kamailio.org/

@@

Package: kamailio-mod-uac-redirect
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio +kamailio-mod-tm
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio User Agent Client redirection module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio User Agent Client redirection module
http://www.kamailio.org/

@@

Package: kamailio-mod-uri-db
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio Database-backend SIP URI checking module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio Database-backend SIP URI checking module
http://www.kamailio.org/

@@

Package: kamailio-mod-userblacklist
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio User blacklists module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio User blacklists module
http://www.kamailio.org/

@@

Package: kamailio-mod-usrloc
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio User location module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio User location module
http://www.kamailio.org/

@@

Package: kamailio-mod-utils
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio +libcurl
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio Misc utilities module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio Misc utilities module
http://www.kamailio.org/

@@

Package: kamailio-mod-xcap-client
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio +libcurl
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio XCAP Client module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio XCAP Client module
http://www.kamailio.org/

@@

Package: kamailio-mod-xlog
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio Advanced logger module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio Advanced logger module
http://www.kamailio.org/

@@

Package: kamailio-mod-xmpp
Submenu: Telephony
Version: 1.5.5-2
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread kamailio +kamailio-mod-tm +libexpat
Menu-Depends: 
Provides: 
Build-Depends: curl expat libxml2 mysql openldap openssl pcre postgresql radiusclient-ng
Section: net
Category: Network
Title: kamailio SIP-to-XMPP Gateway module
Maintainer: 
Source: kamailio-1.5.5-tls_src.tar.gz
Type: ipkg
Description: kamailio SIP-to-XMPP Gateway module
http://www.kamailio.org/

@@


