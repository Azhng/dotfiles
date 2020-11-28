#!/usr/bin/env bash

# iptables -t nat -D POSTROUTING -s 10.66.66.1/24 -o eth0 -j MASQUERADE
iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE
iptables -D INPUT -i wg1 -j ACCEPT
iptables -D FORWARD -i eth0 -o wg1 -j ACCEPT
iptables -D FORWARD -i wg1 -o eth0 -j ACCEPT

ip6tables -t nat -D POSTROUTING -o eth0 -j MASQUERADE
ip6tables -D INPUT -i wg1 -j ACCEPT
ip6tables -D FORWARD -i eth0 -o wg1 -j ACCEPT
ip6tables -D FORWARD -i wg1 -o eth0 -j ACCEPT
