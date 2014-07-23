Source-Makefile: feeds/telephony/net/asterisk-11.x/Makefile
Package: asterisk11
Menu: 1
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread +libopenssl +libncurses +libpopt +libpthread +libsqlite3 +librt +libuuid +zlib @!TARGET_avr32
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: Complete open source PBX, v11.x
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:  Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-sounds
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: Sounds support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:  Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides sounds for Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-app-alarmreceiver
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: Alarm receiver support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support Central Station Alarm receiver for Ademco Contact ID in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-app-authenticate
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: Authenticate commands support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support Execute arbitrary authenticate commands in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-app-confbridge
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: ConfBridge support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support Software bridge for multi-party audio conferencing in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-app-directed_pickup
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: Directed call pickup support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support support for directed call pickup in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-app-disa
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: Direct Inward System Access support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support Direct Inward System Access in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-app-exec
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: Exec application support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support support for application execution in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-app-chanisavail
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: Channel availability check support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support support for checking if a channel is available in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-app-chanspy
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: Channel listen in support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support support for listening in on any channel in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-app-minivm
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: Minimal voicemail system support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support a voicemail system in small building blocks working together based on the Comedian Mail voicemail in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-app-mixmonitor
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: Record a call and mix the audio support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support record a call and mix the audio during the recording in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-app-originate
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: Originate a call support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support originating an outbound call and connecting it to a specified extension or application in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-app-playtones
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: Playtones application support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support play a tone list in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-app-read
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: Variable read support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support a trivial application to read a variable in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-app-readexten
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: Extension to variable support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support a trivial application to read an extension into a variable in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-app-record
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: Record sound file support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support to record a sound file in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-app-sayunixtime
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: Say Unix time support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support an application to say Unix time in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-app-senddtmf
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: Send DTMF digits support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support Sends arbitrary DTMF digits in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-app-sms
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11 +PACKAGE_asterisk11-app-sms:libpopt +PACKAGE_asterisk11-app-sms:libstdcpp
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: SMS support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support SMS support (ETSI ES 201 912 protocol 1) in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-app-stack
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11 +PACKAGE_asterisk11-app-stack:asterisk11-res-agi
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: Stack applications support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support Stack applications Gosub Return etc. in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-app-system
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: System exec support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support support for executing system commands in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-app-talkdetect
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: File playback with audio detect support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support for file playback with audio detect in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-app-verbose
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: Verbose logging support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support Verbose logging application in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-app-waituntil
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: Sleep support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support support sleeping until the given epoch in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-app-while
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: While loop support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support a while loop implementation in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-cdr
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: Provides CDR support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support Call Detail Record in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-cdr-csv
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: Provides CDR CSV support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support Call Detail Record with CSV support in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-cdr-sqlite3
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11 libsqlite3
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: Provides CDR SQLITE3 support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support Call Detail Record with SQLITE3 support in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-codec-a-mu
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: Alaw to ulaw translation support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support translation between alaw and ulaw codecs in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-codec-adpcm
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: ADPCM text support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support ADPCM text  in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-codec-alaw
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: Signed linear to alaw translation support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support translation between signed linear and alaw codecs in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-codec-g722
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: G.722 support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support a high bit rate 48/56/64Kbps ITU standard codec in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-codec-g726
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: Signed linear to G.726 translation support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support translation between signed linear and ITU G.726-32kbps codecs in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-codec-gsm
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: linear to GSM translation support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support translate between signed linear and GSM in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-codec-ilbc
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: linear to ILBC translation support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support translate between signed linear and ILBC in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-codec-lpc10
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: Linear to LPC10 translation support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support translate between signed linear and LPC10 in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-codec-resample
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: resample sLinear audio support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support resample sLinear audio in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-curl
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11 +PACKAGE_asterisk11-curl:libcurl
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: CURL support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support CURL support in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-format-g726
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: G.726 support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support support for headerless G.726 16/24/32/40kbps data format in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-format-g729
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: G.729 support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support support for raw headerless G729 data in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-format-gsm
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: GSM format support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support support for GSM format in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-format-h263
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: H263 format support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support support for H264 format in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-format-h264
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: H264 format support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support support for H264 format in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-format-ilbc
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: ILBC format support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support support for ILBC format in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-format-sln
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: Raw slinear format support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support support for raw slinear format in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-format-vox
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: VOX format support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support support for ADPCM vox format in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-format-wav
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: WAV format (8000hz Signed Linear) support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support support for proprietary Microsoft WAV format (8000hz Signed Linear) in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-format-wav-gsm
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: WAV format (Proprietary GSM) support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support support for proprietary Microsoft WAV format (Proprietary GSM) in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-func-base64
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: base64 support support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support support of base64 function in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-func-blacklist
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: Blacklist on callerid support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support looking up the callerid number and see if it is blacklisted in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-func-cut
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: CUT function support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support CUT function in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-func-db
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: Database interaction support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support functions for interaction with the database in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-func-devstate
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: Blinky lights control support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support functions for manually controlled blinky lights in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-func-extstate
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: Hinted extension state support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support retrieving the state of a hinted extension for dialplan control in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-func-global
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: Global variable support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support global variable dialplan functions in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-func-groupcount
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: Group count support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support for counting number of channels in the specified group in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-func-channel
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: Channel info support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support Channel info dialplan function in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-func-shell
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: Shell support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support support for shell execution in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-func-uri
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: URI encoding and decoding support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support Encodes and decodes URI-safe strings in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-func-vmcount
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: vmcount dialplan support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support a vmcount dialplan function in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-chan-agent
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: Agents proxy channel support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support an implementation of agents proxy channel in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-chan-iax2
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11 +PACKAGE_asterisk11-chan-iax2:asterisk11-res-timing-timerfd
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: IAX2 channel support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support IAX support in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-chan-motif
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11 +PACKAGE_asterisk11-chan-motif:asterisk11-res-xmpp
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: Jingle channel support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support Motif Jingle Channel Driver in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-chan-mgcp
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: MGCP channel support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support the channel chan_mgcp in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-chan-mobile
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11 +PACKAGE_asterisk11-chan-mobile:bluez-libs
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: Mobile channel support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support the channel chan_mobile in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-chan-ooh323
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: ooH323 channel support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support the channel chan_ooh323 in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-chan-skinny
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: Skinny channel support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support the channel chan_skinny in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-chan-unistim
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: Unistim channel support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support channel driver for the UNISTIM (Unified Networks IP Stimulus) protocol in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-mysql
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11 +PACKAGE_asterisk11-mysql:libmysqlclient
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: MySQL support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support MySQL support in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-odbc
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11 +PACKAGE_asterisk11-odbc:libpthread +PACKAGE_asterisk11-odbc:libc +PACKAGE_asterisk11-odbc:unixodbc
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: ODBC support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support ODBC support in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-pgsql
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11 +PACKAGE_asterisk11-pgsql:libpq
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: PostgreSQL support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support PostgreSQL support in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-pbx-ael
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: Asterisk Extension Logic support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support support for symbolic Asterisk Extension Logic in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-pbx-spool
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: Call Spool support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support outgoing call spool support in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-pbx-lua
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11 +PACKAGE_asterisk11-pbx-lua:libpthread +PACKAGE_asterisk11-pbx-lua:libc +PACKAGE_asterisk11-pbx-lua:liblua
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: Lua support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support provides Lua resources for Asterisk in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-res-ael-share
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: Shareable AEL code support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support support for shareable AEL code mainly between internal and external modules in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-res-agi
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: Asterisk Gateway Interface support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support Support for the Asterisk Gateway Interface extension in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-res-clioriginate
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: Calls via CLI support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support Originate calls via the CLI in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-res-monitor
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: Provide Monitor support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support Cryptographic Signature capability in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-res-phoneprov
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: Phone Provisioning support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support Phone provisioning application for the asterisk internal http server in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-res-pktccops
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: Provide PacketCable COPS support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support simple client/server model for supporting policy control over QoS signaling protocols in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-res-smdi
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: Provide SMDI support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support Simple Message Desk Interface capability in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-res-fax
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11 +PACKAGE_asterisk11-res-fax:asterisk11-res-timing-pthread
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: FAX modules support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support Generic FAX resource for FAX technology resource modules in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-res-fax-spandsp
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11 +PACKAGE_asterisk11-res-fax-spandsp:asterisk11-res-fax +PACKAGE_asterisk11-res-fax-spandsp:libspandsp +PACKAGE_asterisk11-res-fax-spandsp:libtiff
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: Spandsp T.38 and G.711 support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support Spandsp T.38 and G.711 FAX Resource in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-res-musiconhold
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: MOH support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support Music On Hold support in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-res-srtp
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11 +PACKAGE_asterisk11-res-srtp:libsrtp
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: SRTP support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support Secure RTP in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-res-timing-pthread
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: pthread Timing Interface support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support  in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-res-timing-timerfd
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: Timerfd Timing Interface support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support  in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-res-xmpp
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11 +PACKAGE_asterisk11-res-xmpp:libiksemel +PACKAGE_asterisk11-res-xmpp:libopenssl
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: XMPP client and component module support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support reference module for interfacting Asterisk directly as a client or component with XMPP server in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@

Package: asterisk11-voicemail
Submenu: Telephony
Version: 11.11.0-3
Depends: +libc +USE_EGLIBC:librt +USE_EGLIBC:libpthread asterisk11
Menu-Depends: 
Provides: 
Section: net
Category: Network
Title: Voicemail support
Maintainer: Jiri Slachta <slachta@cesnet.cz>
Source: asterisk-11.11.0.tar.gz
Type: ipkg
Description:    Asterisk is a complete PBX in software. It provides all of the features
 you would expect from a PBX and more. Asterisk does voice over IP in three
 protocols, and can interoperate with almost all standards-based telephony
 equipment using relatively inexpensive hardware.
This package provides support voicemail related modules in Asterisk.
http://www.asterisk.org/
Jiri Slachta <slachta@cesnet.cz>
@@


