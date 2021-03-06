set -eo nounset
set +h

test -f /etc/udev/rules.d/70-persistent-net.rules || \
bash /lib/udev/init-net-rules.sh

cat /etc/udev/rules.d/70-persistent-net.rules

# checking for CD-ROM device, e.g., "hdd"
#udevadm test /sys/block/hdd

#sed -i -e 's/"write_cd_rules"/"write_cd_rules mode"/' \
#    /etc/udev/rules.d/83-cdrom-symlinks.rules

# checking for video device
#udevadm info -a -p /sys/class/video4linux/video0

#cat > /etc/udev/rules.d/83-duplicate_devs.rules << "EOF"
#
## Persistent symlinks for webcam and tuner
#KERNEL=="video*", ATTRS{idProduct}=="1910", ATTRS{idVendor}=="0d81", \
#    SYMLINK+="webcam"
#KERNEL=="video*", ATTRS{device}=="0x036f", ATTRS{vendor}=="0x109e", \
#    SYMLINK+="tvtuner"
#
#EOF
