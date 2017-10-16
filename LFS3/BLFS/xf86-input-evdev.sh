set -eo nounset

cd /sources

test -f xf86-input-evdev-2.10.5.tar.bz2 || \
wget --no-check-certificate \
	https://www.x.org/pub/individual/driver/xf86-input-evdev-2.10.5.tar.bz2

rm -rf xf86-input-evdev-2.10.5
tar xf xf86-input-evdev-2.10.5.tar.bz2
pushd  xf86-input-evdev-2.10.5

./configure $XORG_CONFIG &&
make

make install

popd
rm -rf xf86-input-evdev-2.10.5
