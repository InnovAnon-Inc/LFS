set -eo nounset
set +h

test -e /etc/fstab || \
cat > /etc/fstab << "EOF"
# Begin /etc/fstab

# file system  mount-point  type     options             dump  fsck
#                                                              order

/dev/sda4      /            ext4     defaults            1     1
/dev/sda3      swap         swap     pri=1               0     0
proc           /proc        proc     nosuid,noexec,nodev 0     0
sysfs          /sys         sysfs    nosuid,noexec,nodev 0     0
devpts         /dev/pts     devpts   gid=5,mode=620      0     0
tmpfs          /run         tmpfs    defaults            0     0
devtmpfs       /dev         devtmpfs mode=0755,nosuid    0     0

#noauto,user,quiet,showexec,iocharset=koi8r,codepage=866
#noauto,user,quiet,showexec,iocharset=utf8,codepage=866

# End /etc/fstab
EOF

# TODO
hdparm -I /dev/sda | grep NCQ
