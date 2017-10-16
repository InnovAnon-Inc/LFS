set -eo nounset

cd /sources

test -f libevdev-1.5.7.tar.xz || \
wget --no-check-certificate \
	https://www.freedesktop.org/software/libevdev/libevdev-1.5.7.tar.xz

rm -rf libevdev-1.5.7
tar xf libevdev-1.5.7.tar.xz
pushd  libevdev-1.5.7

./configure $XORG_CONFIG &&
make

make install

popd
rm -rf libevdev-1.5.7
