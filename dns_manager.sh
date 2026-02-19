#!/bin/bash

# Configuration
CONN_NAME="errorr"
DNS_SERVERS="176.99.11.77 80.78.247.254"

if [ "$1" == "on" ]; then
    echo "Setting DNS to xbox-dns.ru ($DNS_SERVERS)..."
    nmcli connection modify "$CONN_NAME" ipv4.dns "$DNS_SERVERS"
    nmcli connection modify "$CONN_NAME" ipv4.ignore-auto-dns yes
    nmcli connection up "$CONN_NAME"
    # Try to send a notification if possible
    notify-send "DNS Changed" "Active: xbox-dns.ru" -i network-wired-symbolic 2>/dev/null
elif [ "$1" == "off" ] || [ "$1" == "default" ]; then
    echo "Reverting DNS to router defaults (DHCP)..."
    nmcli connection modify "$CONN_NAME" ipv4.dns ""
    nmcli connection modify "$CONN_NAME" ipv4.ignore-auto-dns no
    nmcli connection up "$CONN_NAME"
    # Try to send a notification if possible
    notify-send "DNS Reset" "Active: Router Default" -i network-wireless-symbolic 2>/dev/null
else
    echo "Usage: $0 {on|off}"
    exit 1
fi
