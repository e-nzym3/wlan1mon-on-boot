#!/bin/bash
log_file="/home/war/Desktop/wlan1_iface.log"
date +"%D %T" > $log_file
echo "wlan1 interface script log" >> $log_file
while true; do
    OUT="$(ip a show wlan1 up)"
    if [[ $OUT =~ "does not exist." ]]; then
        date +"%D %T" >> $log_file
        echo "wlan1 is down" >> $log_file
        sleep 2
    else
        date +"%D %T" >> $log_file
        sudo airmon-ng start wlan1 | tee -a $log_file
        sleep 10
        wlan_OUT="$(ip a show wlan1mon up)"
        if [[ $wlan_OUT =~ "does not exist." ]]; then
            date +"%D %T" >> $log_file
            echo "wlan1mon still does not exist" >> $log_file
        else
            date +"%D %T" >> $log_file
            echo "wlan1mon started!" >> $log_file
            chown war:war $log_file
            break
        fi
    fi
done