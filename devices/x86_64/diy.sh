#!/bin/bash

svn co https://github.com/coolsnowwolf/lede/trunk/target/linux/x86/patches-5.4 target/linux/x86/patches-5.4
rm -rf target/linux/x86/patches-5.4/.svn

sed -i 's,kmod-r8169,kmod-r8168,g' target/linux/x86/image/64.mk

sed -i 's,"eth0 eth2 eth3" "eth1","eth1 eth2 eth3" "eth0",g' target/linux/x86/base-files/etc/board.d/02_network
sed -i 's,"eth0 eth2 eth3 eth4 eth5 eth6 eth7" "eth1","eth1 eth2 eth3 eth4 eth5 eth6 eth7" "eth0",g' target/linux/x86/base-files/etc/board.d/02_network

echo '
CONFIG_CRYPTO_CHACHA20_X86_64=y
CONFIG_CRYPTO_POLY1305_X86_64=y
CONFIG_DRM=y
CONFIG_DRM_I915=y
' >> ./target/linux/x86/config-5.4

sed -i "s/enabled '0'/enabled '1'/g" feeds/packages/utils/irqbalance/files/irqbalance.config

