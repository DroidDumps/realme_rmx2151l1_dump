#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:102760448:31d5c48088d619f9dd486422bf9c3c1187a6ed70; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/spmfw:11632:244f0d2da1d66626483210a66abcccd97a64a15c \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:102760448:31d5c48088d619f9dd486422bf9c3c1187a6ed70 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
