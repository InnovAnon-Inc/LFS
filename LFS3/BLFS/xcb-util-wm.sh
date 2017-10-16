set -eo nounset

cd /sources

test -f xcb-util-wm-0.4.1.tar.bz2 || \
wget --no-check-certificate \
	https://xcb.freedesktop.org/dist/xcb-util-wm-0.4.1.tar.bz2

rm -rf xcb-util-wm-0.4.1
tar xf xcb-util-wm-0.4.1.tar.bz2
pushd  xcb-util-wm-0.4.1

./configure $XORG_CONFIG &&
make

make install

popd
rm -rf xcb-util-wm-0.4.1
