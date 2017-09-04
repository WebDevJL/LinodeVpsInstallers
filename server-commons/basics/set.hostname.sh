#!/bin/bash
# $1 => hostname

echo "Setting up the basics... Set hostname..."
cp /etc/hostname /etc/hostname.bak
echo "$1" > /etc/hostname
hostnamectl set-hostname $1
echo "Setting up the basics... hostname set!"
read -n1 -rsp $'If you see "deflate_module (shared)", pPress any key to continue or Ctrl+C to exit...\n'
