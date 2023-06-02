#!/bin/sh

ip addr list

echo "Type: interface ssid key <ENTER>"

read interface ssid key; wpa_passphrase $ssid $key > wpa_supplicant.conf

sed -i 's/\(\s\+\)#psk=.*$/\1key_mgmt=WPA-PSK/g' wpa_supplicant.conf

ip link set dev $interface up

wpa_supplicant -B -D nl80211 -i $interface -c wpa_supplicant.conf

dhcpcd $interface

