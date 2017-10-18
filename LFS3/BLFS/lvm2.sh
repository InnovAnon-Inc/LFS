set -eo nounset

cd /sources

test -f LVM2.2.02.175.tgz || \
wget --no-check-certificate \
	https://sourceware.org/ftp/lvm2/releases/LVM2.2.02.175.tgz

rm -rf LVM2.2.02.175
tar xf LVM2.2.02.175.tgz
pushd  LVM2.2.02.175

SAVEPATH=$PATH                  &&
PATH=$PATH:/sbin:/usr/sbin      &&
./configure --prefix=/usr       \
            --exec-prefix=      \
            --enable-applib     \
            --enable-cmdlib     \
            --enable-pkgconfig  \
            --enable-udev_sync  &&
make                            &&
PATH=$SAVEPATH                  &&
unset SAVEPATH

make -C tools install_dmsetup_dynamic &&
make -C udev  install                 &&
make -C libdm install

#     --with-thin-check=    \
#     --with-thin-dump=     \
#     --with-thin-repair=   \
#     --with-thin-restore=  \
#     --with-cache-check=   \
#     --with-cache-dump=    \
#     --with-cache-repair=  \
#     --with-cache-restore= \

make install

popd
rm -rf LVM2.2.02.175
