#!/bin/bash
echo "Setting up the basics... Set hostname..."
dpkg-reconfigure tzdata
ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime
date
echo "Setting up the basics... timezone set!"
read -n1 -rsp $'If you see "deflate_module (shared)", pPress any key to continue or Ctrl+C to exit...\n'
