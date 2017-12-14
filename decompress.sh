#!/bin/sh
if [ $# -eq 0 ];then
	echo usage: 2.self_compression.sh [--list] or [sourse compressed file] [Destination path]
	exit 2
elif [ "$1" = "--list" ];then
	echo Supported types: zip tar tar.gz tar.bz2
	exit 1
else
	A=$1
	B=$2
	if [ "${A##*.}" = "zip" ];then
		if [ $# -eq 1 ];then
			unzip $A
		else
			unzip $A -d $B
		fi
	elif [ "${A##*.}" = "tar" ];then
		if [ $# -eq 1 ];then
			tar -xvf $A
		else
			tar -xvf $A -C $B
		fi
	elif [ "${A##*.}" = "gz" ];then
		if [ $# -eq 1 ];then
			tar -zxvf $A
		else
			tar -zxvf $A -C $B
		fi
	else
		if [ $# -eq 1 ];then
			tar -jxvf $A
		else
			tar -jxvf $A -C $B
		fi 
		exit 3
	fi
	exit 0
fi
