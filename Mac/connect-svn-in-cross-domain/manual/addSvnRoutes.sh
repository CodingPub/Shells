#!/bin/sh
# Set static routing tables
sudo route add -net 192.168.0.0 -netmask 255.255.0.0 -gateway 172.17.152.1
exit 0