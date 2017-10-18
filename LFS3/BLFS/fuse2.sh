set -eo nounset

cd /sources

test -f fuse-2.9.7.tar.gz || \
wget --no-check-certificate \
	https://github.com/libfuse/libfuse/releases/download/fuse-2.9.7/fuse-2.9.7.tar.gz

rm -rf fuse-2.9.7
tar xf fuse-2.9.7.tar.gz
pushd  fuse-2.9.7

./configure --prefix=/usr    \
            --disable-static \
            --exec-prefix=/  &&

make &&
make DESTDIR=$PWD/Dest install

install -vm755 Dest/lib/libfuse.so.2.9.7 /lib                  &&
install -vm755 Dest/lib/libulockmgr.so.1.0.1 /lib                 &&
ln -sfv ../../lib/libfuse.so.2.9.7 /usr/lib/libfuse.so         &&
ln -sfv ../../lib/libulockmgr.so.1.0.1 /usr/lib/libulockmgr.so &&

install -vm644  Dest/lib/pkgconfig/fuse.pc /usr/lib/pkgconfig  && 
                                                         
install -vm4755 Dest/bin/fusermount       /bin                 &&
install -vm755  Dest/bin/ulockmgr_server  /bin                 &&

install -vm755  Dest/sbin/mount.fuse      /sbin                &&

install -vdm755 /usr/include/fuse                              &&

install -vm644  Dest/usr/include/*.h      /usr/include         &&
install -vm644  Dest/usr/include/fuse/*.h /usr/include/fuse/   &&

install -vm644  Dest/usr/share/man/man1/* /usr/share/man/man1  &&
/sbin/ldconfig -v

popd
rm -rf fuse-2.9.7
