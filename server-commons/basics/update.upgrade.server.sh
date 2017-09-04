#!/bin/bash
echo "Setting up the basics... starting with update and upgrade of the server..."
apt-get update && apt-get upgrade
echo "Setting up the basics... done with update and upgrade of the server!"
read -n1 -rsp $'If you see "deflate_module (shared)", pPress any key to continue or Ctrl+C to exit...\n'
