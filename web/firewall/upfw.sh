#!/bin/sh

# iptables -A INPUT -p tcp -s 172.18.0.50 --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 ! --sport 53 -j DROP
# iptables -A INPUT -p tcp --dport 80 -j DROP
# iptables -A INPUT -p tcp --dport 80 -m string --algo bm --string "Nmap" -j DROP
