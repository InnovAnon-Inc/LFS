set -eo nounset

cd /sources

test -f libinput-1.8.3.tar.xz || \
wget --no-check-certificate \
	https://www.freedesktop.org/software/libinput/libinput-1.8.3.tar.xz

rm -rf libinput-1.8.3
tar xf libinput-1.8.3.tar.xz
pushd  libinput-1.8.3

./configure $XORG_CONFIG            \
            --disable-libwacom      \
            --disable-debug-gui     \
            --disable-tests         \
            --disable-documentation \
            --with-udev-dir=/lib/udev &&
make

#ln -sfv ld-2.23.so.dbg /lib/ld-linux-x86-64.so.2

make install

# TODO test for doxygen and graphviz
#install -v -dm755 $XORG_PREFIX/share/doc/libinput-1.8.3 &&
#cp -rv doc/html/* $XORG_PREFIX/share/doc/libinput-1.8.3

popd
rm -rf libinput-1.8.3
