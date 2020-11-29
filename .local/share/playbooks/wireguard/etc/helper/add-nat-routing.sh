#!/usr/bin/env bash

# iptables -t nat -I POSTROUTING 1 -s 10.66.66.1/24 -o eth0 -j MASQUERADE
iptables -t nat -I POSTROUTING 1 -o eth0 -j MASQUERADE
iptables -I INPUT 1 -i wg1 -j ACCEPT
iptables -I FORWARD 1 -i eth0 -o wg1 -j ACCEPT
iptables -I FORWARD 1 -i wg1 -o eth0 -j ACCEPT

ip6tables -t nat -I POSTROUTING 1 -o eth0 -j MASQUERADE
ip6tables -I INPUT 1 -i wg1 -j ACCEPT
ip6tables -I FORWARD 1 -i eth0 -o wg1 -j ACCEPT
ip6tables -I FORWARD 1 -i wg1 -o eth0 -j ACCEPT
