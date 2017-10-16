set -eo nounset

# TODO this is probably unnecessary on a modern LFS system

cd /sources

test -f xf86-input-vmmouse-13.1.0.tar.bz2 || \
wget --no-check-certificate \
	https://www.x.org/pub/individual/driver/xf86-input-vmmouse-13.1.0.tar.bz2

rm -rf xf86-input-vmmouse-13.1.0
tar xf xf86-input-vmmouse-13.1.0.tar.bz2
pushd  xf86-input-vmmouse-13.1.0

./configure $XORG_CONFIG               \
            --without-hal-fdi-dir      \
            --without-hal-callouts-dir \
            --with-udev-rules-dir=/lib/udev/rules.d &&
make

make install

popd
rm -rf xf86-input-vmmouse-13.1.0
