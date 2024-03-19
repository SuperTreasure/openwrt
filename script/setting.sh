#! /bin/bash

# 网络配置信息，将从 zzz-default-settings 文件的第2行开始添加
sed -i "2i # network config" openwrt/package/lean/default-settings/files/zzz-default-settings
# 默认 IP 地址，旁路由时不会和主路由的 192.168.1.1 冲突
sed -i "3i uci set network.lan.ipaddr='192.168.31.23'" openwrt/package/lean/default-settings/files/zzz-default-settings
sed -i "4i uci set network.lan.proto='static'" openwrt/package/lean/default-settings/files/zzz-default-settings # 静态 IP
sed -i "5i uci set network.lan.type='bridge'" openwrt/package/lean/default-settings/files/zzz-default-settings  # 接口类型：桥接
sed -i "6i uci set network.lan.ifname='eth0'" openwrt/package/lean/default-settings/files/zzz-default-settings  # 网络端口：默认 eth0，第一个接口
sed -i "7i uci set network.lan.netmask='255.255.255.0'" openwrt/package/lean/default-settings/files/zzz-default-settings    # 子网掩码
sed -i "8i uci set network.lan.gateway='192.168.31.1'" openwrt/package/lean/default-settings/files/zzz-default-settings  # 默认网关地址（主路由 IP）
sed -i "9i uci set network.lan.dns='223.5.5.5 223.6.6.6'" openwrt/package/lean/default-settings/files/zzz-default-settings  # 默认上游 DNS 地址
sed -i "10i uci set network.lan.broadcast='192.168.31.255'" openwrt/package/lean/default-settings/files/zzz-default-settings  # 默认上游 DNS 地址
sed -i "11i uci commit network\n" openwrt/package/lean/default-settings/files/zzz-default-settings
