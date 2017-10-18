set -eo nounset

export LFS=/mnt/lfs

if [ ! -d /mnt/lfs/workspace ] ; then
	mkdir -v /mnt/lfs/workspace
	chmod a+wt /mnt/lfs/workspace
fi
if [ ! -d /mnt/lfs/workspace/LFS ] ; then
	cp -r /workspace/LFS /mnt/lfs/workspace/LFS
fi

./preparing-virtual-kernel-file-systems.sh

chroot "$LFS" /tools/bin/env -i \
    HOME=/root                  \
    TERM="$TERM"                \
    PS1='\u:\w\$ '              \
    PATH=/bin:/usr/bin:/sbin:/usr/sbin:/tools/bin \
    /tools/bin/bash +h << EOF
cd /workspace/LFS/LFS3/BASE
./base.sh
EOF
