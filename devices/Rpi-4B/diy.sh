#!/bin/bash

sed -i 's,ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305,ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256,g' package/feeds/kiddin9/luci-app-bypass/root/usr/share/ssrplus/gentrojanconfig
sed -i 's,TLS_AES_128_GCM_SHA256:TLS_CHACHA20_POLY1305_SHA256,TLS_CHACHA20_POLY1305_SHA256:TLS_AES_128_GCM_SHA256,g' package/feeds/kiddin9/luci-app-bypass/root/usr/share/ssrplus/gentrojanconfig

sed -i 's/DEFAULT_PACKAGES +=/DEFAULT_PACKAGES += my-autocore-arm luci-app-cpufreq kmod-usb-net-asix-ax88179 kmod-usb-net-rtl8152/' target/linux/bcm27xx/Makefile

sed -i 's/factory.img.gz //' target/linux/bcm27xx/image/Makefile

echo '
CONFIG_ARM64_CRYPTO=y
CONFIG_CRYPTO_AES_ARM64=y
CONFIG_CRYPTO_AES_ARM64_BS=y
CONFIG_CRYPTO_AES_ARM64_CE=y
CONFIG_CRYPTO_AES_ARM64_CE_BLK=y
CONFIG_CRYPTO_AES_ARM64_CE_CCM=y
CONFIG_CRYPTO_AES_ARM64_NEON_BLK=y
CONFIG_CRYPTO_CRYPTD=y
CONFIG_CRYPTO_GF128MUL=y
CONFIG_CRYPTO_GHASH_ARM64_CE=y
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA1_ARM64_CE=y
CONFIG_CRYPTO_SHA256_ARM64=y
CONFIG_CRYPTO_SHA2_ARM64_CE=y
CONFIG_CRYPTO_SHA512_ARM64=y
CONFIG_CRYPTO_SIMD=y
CONFIG_REALTEK_PHY=y
CONFIG_CPU_FREQ_GOV_USERSPACE=y
CONFIG_CPU_FREQ_GOV_ONDEMAND=y
CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
' >> ./target/linux/bcm27xx/bcm2711/config-5.10
