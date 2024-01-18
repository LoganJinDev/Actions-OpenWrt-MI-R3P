#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.31.1/g' package/base-files/files/bin/config_generate
# Modify default hostname
sed -i "s/hostname='.*'/hostname='LoganJin-MI-R3P'/g" package/base-files/files/bin/config_generate
# Modify default timezone
sed -i "s/timezone='.*'/timezone='CST-8'/g" package/base-files/files/bin/config_generate
# Add zonename
sed -i "/.*ttylogin='0'.*/i\                set system.@system[-1].zonename='Asia/Shanghai'" package/base-files/files/bin/config_generate
# Openclash depend on the package
sudo apt-get update && sudo apt-get -y install build-essential asciidoc binutils bzip2 gawk gettext git libncurses5-dev libz-dev patch python3.5 python2.7 unzip zlib1g-dev lib32gcc1 libc6-dev-i386 subversion flex uglifyjs git-core gcc-multilib p7zip p7zip-full msmtp libssl-dev texinfo libglib2.0-dev xmlto qemu-utils upx libelf-dev autoconf automake libtool autopoint device-tree-compiler g++-multilib antlr3 gperf wget
# Change mosdns_neo to mosdns
sed -i 's/mosdns.*neo/mosdns/g' feeds/kenzo/luci-app-mosdns/Makefile
# ttyd Log in by default
sed -i 's/\/bin\/login/\/bin\/login -f root/' `find . -name "ttyd.config"`
