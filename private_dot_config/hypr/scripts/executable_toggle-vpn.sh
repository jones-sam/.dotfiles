#!/bin/bash

VPN_NAME="deli"
VPN_STATUS=$(nmcli connection show --active | grep "$VPN_NAME")

if [ -z "$VPN_STATUS" ]; then
    # VPN is off, turn it on
    nmcli connection up "$VPN_NAME"
    notify-send "VPN Activated" "$VPN_NAME is now connected"
else
    # VPN is on, turn it off
    nmcli connection down "$VPN_NAME"
    notify-send "VPN Deactivated" "$VPN_NAME is now disconnected"
fi
