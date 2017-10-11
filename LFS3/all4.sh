set -eo nounset

MNT=/mnt/lfs

cp -a /workspace/LFS/LFS3/* /mnt/lfs/alfs

#LFS=$MNT ./preparing-virtual-kernel-file-systems.sh

chroot "$MNT" /tools/bin/env -i \
    HOME=/root                  \
    TERM="$TERM"                \
    PS1='\u:\w\$ '              \
    PATH=/bin:/usr/bin:/sbin:/usr/sbin:/tools/bin \
    /bin/bash +h << EOF
cd /alfs/BASE
./base2.sh
EOF
