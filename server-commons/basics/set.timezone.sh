#!/bin/bash
echo "Setting up the basics... Set hostname..."
dpkg-reconfigure tzdata
ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime
date
read -n1 -rsp $'Setting up the basics... timezone set! pPress any key to continue or Ctrl+C to exit...\n'
