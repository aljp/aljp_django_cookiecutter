#!/usr/bin/env bash

echo "IP Address Of Host Machine From Vagrant Guest"
ifconfig docker0 | grep inet | cut -d " " -f12 | cut -d ":" -f2

echo "IP Address Of Vagrant From Docker Container"
netstat -rn | grep "0.0.0.0 " | cut -d " " -f10 | grep "^[0-9][0-9.]*"

echo "Using iptables to forward connection or whatever it's doing ~~~ more information at https://www.reddit.com/r/devops/comments/3yunh4/remote_debugging_python_applications_hosted_with/"
echo "Executing \"iptables -t nat -A PREROUTING -p tcp --dport 12546 -j DNAT --to-destination 10.0.2.2:12546\"..."
iptables -t nat -A PREROUTING -p tcp --dport 12546 -j DNAT --to-destination 10.0.2.2:12546
sleep 1
echo "Executing \"iptables -t nat -A POSTROUTING -j MASQUERADE\"..."
iptables -t nat -A POSTROUTING -j MASQUERADE
sleep 1
echo "Done"