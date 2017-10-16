set -eo nounset

cd /sources

test -f xf86-input-wacom-0.35.0.tar.bz2 || \
wget --no-check-certificate \
	https://downloads.sourceforge.net/linuxwacom/xf86-input-wacom-0.35.0.tar.bz2

rm -rf xf86-input-wacom-0.35.0
tar xf xf86-input-wacom-0.35.0.tar.bz2
pushd  xf86-input-wacom-0.35.0

./configure $XORG_CONFIG \
            --with-udev-rules-dir=/lib/udev/rules.d \
            --with-systemd-unit-dir=/lib/systemd/system &&
make

make install

popd
rm -rf xf86-input-wacom-0.35.0
