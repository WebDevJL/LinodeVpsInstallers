#!/bin/bash
echo "Setting up the basics... starting with update and upgrade of the server..."
apt-get update && apt-get upgrade
echo "Server up-to-date!
#read -n1 -rsp $'Setting up the basics... done with update and upgrade of the server! pPress any key to continue or Ctrl+C to exit...\n'
