#!/bin/bash
# DIY script - Part 1: runs after feeds update, before config
# Modify default settings here

# Change default IP to 192.168.1.1
sed -i 's/192.168.1.1/192.168.1.1/g' package/base-files/files/bin/config_generate

# Add build info to banner
echo "$(date +%Y%m%d) - LEDE X86" > package/base-files/files/etc/banner

# Add custom feeds or patches here
# echo "src-git custom https://github.com/username/custom-packages.git" >> feeds.conf.default
