set +h
umask 022
LFS=/mnt/lfs
LC_ALL=POSIX
LFS_TGT=$(uname -m)-lfs-linux-gnu
PATH=/tools/bin:/usr/lib/ccache:/bin:/usr/bin:/usr/local/bin
export LFS LC_ALL LFS_TGT PATH
