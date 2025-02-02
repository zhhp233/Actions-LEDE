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


#rm -rfv feeds/packages/net/mosdns
#find ./ | grep Makefile | grep luci-app-mosdns | xargs rm -fv
#git clone https://github.com/sbwml/luci-app-mosdns -b v5 package/mosdns

# Replace Smartdns
./scripts/feeds uninstall luci-app-smartdns smartdns
./scripts/feeds install -a -p customsd

# Replace adguardhome
#rm -rfv feeds/packages/net/adguardhome
#git clone https://github.com/Ljzkirito/adguardhome-openwrt feeds/packages/net/adguardhome

sed -i 's/192.168.1.1/10.10.1.1/g' package/base-files/files/bin/config_generate

git clone https://github.com/zzsj0928/luci-app-pushbot package/luci-app-pushbot

git clone https://github.com/sirpdboy/luci-app-lucky.git package/lucky

git clone https://github.com/linkease/nas-packages.git package/nas

git clone https://github.com/linkease/nas-packages-luci.git package/nas-luci

git clone https://github.com/linkease/istore package/istore

#git clone --depth=1 -b master https://github.com/fw876/helloworld
#Replace_package="xray-core xray-plugin v2ray-core v2ray-plugin hysteria ipt2socks microsocks redsocks2 chinadns-ng dns2socks dns2tcp naiveproxy simple-obfs tcping tuic-client"
#for a in ${Replace_package}
#do
#	echo "Replace_package=$a"
# 	rm -rfv feeds/packages/net/"$a"
#	cp -rv helloworld/"$a" feeds/packages/net
#done
# sed -i 's/ +libopenssl-legacy//g' feeds/packages/net/shadowsocksr-libev/Makefile
#rm -rfv feeds/luci/applications/luci-app-ssr-plus
#cp -rv helloworld/luci-app-ssr-plus feeds/luci/applications
#cp -rv helloworld/shadow-tls package
#rm -rfv helloworld
# Remove upx commands
#makefile_file="$({ find package|grep Makefile |sed "/Makefile./d"; } 2>"/dev/null")"
#for a in ${makefile_file}
#do
#	[ -n "$(grep "upx" "$a")" ] && sed -i "/upx/d" "$a"
#done
