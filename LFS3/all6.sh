set -eo nounset

export LFS=/mnt/lfs

# TODON'T
#./preparing-virtual-kernel-file-systems.sh

chroot "$LFS" /usr/bin/env -i \
    HOME=/root                  \
    TERM="$TERM"                \
    PS1='\u:\w\$ '              \
    PATH=/bin:/usr/bin:/sbin:/usr/sbin \
    /bin/bash +h << EOF
cd /workspace/LFS/LFS3/BASE
./base4.sh
EOF
