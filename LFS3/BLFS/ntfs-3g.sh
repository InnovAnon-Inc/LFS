set -eo nounset

cd /sources

test -f ntfs-3g_ntfsprogs-2017.3.23.tgz || \
wget --no-check-certificate \
	 https://tuxera.com/opensource/ntfs-3g_ntfsprogs-2017.3.23.tgz

rm -rf ntfs-3g_ntfsprogs-2017.3.23
tar xf ntfs-3g_ntfsprogs-2017.3.23.tgz
pushd ntfs-3g_ntfsprogs-2017.3.23

./configure --prefix=/usr        \
            --disable-static     \
            --with-fuse=internal &&
make

make install &&
ln -sv ../bin/ntfs-3g /sbin/mount.ntfs &&
ln -sv ntfs-3g.8 /usr/share/man/man8/mount.ntfs.8

chmod -v 4755 /bin/ntfs-3g

# in /etc/fstab
#/dev/sda1 /mnt/windows auto defaults 0 0
#/dev/sdc1 /mnt/usb auto user,noauto,umask=0,utf8 0 0

test -d /mnt/usb || mkdir -v /mnt/usb
chmod -v 777 /mnt/usb

popd
rm -rf ntfs-3g_ntfsprogs-2017.3.23
