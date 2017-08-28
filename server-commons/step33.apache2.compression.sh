#!/bin/bash
# Source : assets/guides/see mod_deflate.install.ubuntu.pdf
echo "Installing and configuring GZip compression..."
echo "First, let's check if mod_deflate is enabled..."
apachectl -t -D DUMP_MODULES |grep deflate
read -n1 -rsp $'If you see "deflate_module (shared)", pPress any key to continue or Ctrl+C to exit...\n'
