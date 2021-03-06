#!/bin/bash

sudo iptables -t nat -A POSTROUTING -o wlan0 -j MASQUERADE;
sudo iptables -A FORWARD -i wlan0 -o wlan1 -m state --state RELATED,ESTABLISHED -j ACCEPT;
sudo iptables -A FORWARD -i wlan1 -o wlan0 -j ACCEPT;
sudo sh -c "iptables-save > /etc/iptables.ipv4.nat";

