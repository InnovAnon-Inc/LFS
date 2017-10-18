set -eo nounset

export LFS=/mnt/lfs

# TODON'T
#./preparing-virtual-kernel-file-systems.sh

# this handles the case when the host has a separate /boot partition
#mount -v --bind /boot $LFS/boot
#trap "umount -vf /boot $LFS/boot" 0

( set -eo nounset
cat << EOF
cd /workspace/LFS/LFS3/BASE
./base5.sh
EOF
cat
) | \
chroot "$LFS" /usr/bin/env -i \
    HOME=/root                  \
    TERM="$TERM"                \
    PS1='\u:\w\$ '              \
    PATH=/bin:/usr/bin:/sbin:/usr/sbin \
    /bin/bash +h
