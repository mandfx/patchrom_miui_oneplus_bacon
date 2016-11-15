#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 10274816 43a86f0364e4a243861e6c178358ca69ed9ac954 7460864 f0a812821cc5a3083bd3055144c246c891e1b169
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:10274816:43a86f0364e4a243861e6c178358ca69ed9ac954; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:7460864:f0a812821cc5a3083bd3055144c246c891e1b169 EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery 43a86f0364e4a243861e6c178358ca69ed9ac954 10274816 f0a812821cc5a3083bd3055144c246c891e1b169:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
