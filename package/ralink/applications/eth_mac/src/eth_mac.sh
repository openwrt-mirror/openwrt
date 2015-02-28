#!/bin/sh

Usage()
{
	echo "Usage: $0 <side> <op> [mac_address]"
	echo "  <side>: lan or wan (access LAN or WAN MAC address)"
	echo "  <op>: -r or -w (Read or Write action)"
	echo "  [mac_address]: MAC[1] MAC[2] MAC[3] MAC[4] MAC[5] MAC[6] (only for write action)"
	echo "Example:"
	echo "	$0 lan -r"
	echo "	$0 lan -w 00 0c 43 68 55 56"
	exit 1
}

GetMac()
{
	if [ "$1" == "lan" ]; then
		B1=`flash -r 4E000 -c 1 | sed 's/^.*: //g'`
		B2=`flash -r 4E001 -c 1 | sed 's/^.*: //g'`
		B3=`flash -r 4E002 -c 1 | sed 's/^.*: //g'`
		B4=`flash -r 4E003 -c 1 | sed 's/^.*: //g'`
		B5=`flash -r 4E004 -c 1 | sed 's/^.*: //g'`
		B6=`flash -r 4E005 -c 1 | sed 's/^.*: //g'`
	else
		B1=`flash -r 4E006 -c 1 | sed 's/^.*: //g'`
		B2=`flash -r 4E007 -c 1 | sed 's/^.*: //g'`
		B3=`flash -r 4E008 -c 1 | sed 's/^.*: //g'`
		B4=`flash -r 4E009 -c 1 | sed 's/^.*: //g'`
		B5=`flash -r 4E00a -c 1 | sed 's/^.*: //g'`
		B6=`flash -r 4E00b -c 1 | sed 's/^.*: //g'`
	fi
	echo "$1 mac address: $B1 $B2 $B3 $B4 $B5 $B6"
}

SetMac()
{
	if [ "$1" == "lan" ]; then
		flash -w 0x4E000 -o $2 1>/dev/null 2>&1
		flash -w 0x4E001 -o $3 1>/dev/null 2>&1
		flash -w 0x4E002 -o $4 1>/dev/null 2>&1
		flash -w 0x4E003 -o $5 1>/dev/null 2>&1
		flash -w 0x4E004 -o $6 1>/dev/null 2>&1
		flash -w 0x4E005 -o $7 1>/dev/null 2>&1
	elif [ "$1" == "wan" ]; then
		flash -w 0x4E006 -o $2 1>/dev/null 2>&1
		flash -w 0x4E007 -o $3 1>/dev/null 2>&1
		flash -w 0x4E008 -o $4 1>/dev/null 2>&1
		flash -w 0x4E009 -o $5 1>/dev/null 2>&1
		flash -w 0x4E00a -o $6 1>/dev/null 2>&1
		flash -w 0x4E00b -o $7 1>/dev/null 2>&1
	fi
}

if [ "$1" != "lan" -a "$1" != "wan" ]; then
	Usage
fi

if [ "$2" == "-r" ]; then
	GetMac $1	
	exit 0
elif [ "$2" == "-w" ]; then
	if [ "$8" == "" ]; then
		echo "Mac address must be 6 bytes!"
		exit 1
	fi
	SetMac $1 $3 $4 $5 $6 $7 $8
else
	echo "Unknown command!"
	exit 1
fi

