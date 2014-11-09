#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 7692288 f28b69edb6440dc8b69ca235e5eeefc6393e698b 5713920 e3253ff8e1367a66562305b694b1ec6d7a83d02d
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:7692288:f28b69edb6440dc8b69ca235e5eeefc6393e698b; then
  log -t recovery "Installing new recovery image"
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:5713920:e3253ff8e1367a66562305b694b1ec6d7a83d02d EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery f28b69edb6440dc8b69ca235e5eeefc6393e698b 7692288 e3253ff8e1367a66562305b694b1ec6d7a83d02d:/system/recovery-from-boot.p
else
  log -t recovery "Recovery image already installed"
fi
