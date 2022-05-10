#! /bin/sh

customerid=`cat /app/config.xml | /app/grep UserID | awk -F"[<>]" '{ print $3}'`
echo "$customerid"

let "customerid=customerid>>20"
let "customerid=customerid&0xff"

if [ -n "$1" ];then
    if [ -b /dev/$1 ];then
        if [ ! -d /sdcard ]; then
            mkdir -p /sdcard
        fi
	mount /dev/$1 /sdcard

	if [ "$customerid" == "2" ];then
        	if [ -b /dev/mmcblk0p1 ]; then
                	if [ ! -d /sdcard/PHOTO ]; then
                        	mkdir -p /sdcard/PHOTO
                	fi
               		if [ ! -d /sdcard/VIDEO ]; then
                        	mkdir -p /sdcard/VIDEO 
                	fi
        	fi
	else
        	if [ -b /dev/mmcblk0p1 ]; then 
                	if [ ! -d /sdcard/WiFi-FPV ]; then
                        	mkdir -p /sdcard/WiFi-FPV
                	fi
                	if [ ! -d /sdcard/WiFi-FPV/PHOTO ]; then
                        	mkdir -p /sdcard/WiFi-FPV/PHOTO
                	fi        
                	if [ ! -d /sdcard/WiFi-FPV/VIDEO ]; then
                        	mkdir -p /sdcard/WiFi-FPV/VIDEO  
                	fi        
        	fi                                                                                                           
	fi
    fi
fi
