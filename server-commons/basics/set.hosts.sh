#!/bin/bash
# $1 => IPv4
# $2 => IPv6
# $3 => hostname
echo "Setting up the basics... Set hosts..."
cp /etc/hosts /etc/hosts.bak
echo "$1 $3" >> /etc/hosts
echo "$2 $3" >> /etc/hosts
#vim /etc/hosts
#read -n1 -rsp $'Setting up the basics... hosts set! pPress any key to continue or Ctrl+C to exit...\n'
