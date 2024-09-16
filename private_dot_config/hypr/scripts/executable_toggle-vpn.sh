#!/bin/bash

VPN_NAME="deli"
VPN_STATUS=$(nmcli connection show --active | grep "$VPN_NAME")

if [ -z "$VPN_STATUS" ]; then
    # VPN is off, turn it on
    nmcli connection up "$VPN_NAME"
    if [ $? -ne 0 ]; then
        notify-send "VPN Activation Failed" "Could not connect to $VPN_NAME"
        exit 1
    fi
    notify-send "VPN Activated" "$VPN_NAME is now connected"
else
    # VPN is on, turn it off
    nmcli connection down "$VPN_NAME"
    if [ $? -ne 0 ]; then
        notify-send "VPN Deactivation Failed" "Could not disconnect from $VPN_NAME"
        exit 1
    fi
    notify-send "VPN Deactivated" "$VPN_NAME is now disconnected"
fi
