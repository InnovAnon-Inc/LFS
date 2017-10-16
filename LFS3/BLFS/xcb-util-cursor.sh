set -eo nounset

cd /sources

test -f xcb-util-cursor-0.1.3.tar.bz2 || \
wget --no-check-certificate \
	https://xcb.freedesktop.org/dist/xcb-util-cursor-0.1.3.tar.bz2

rm -rf xcb-util-cursor-0.1.3
tar xf xcb-util-cursor-0.1.3.tar.bz2
pushd  xcb-util-cursor-0.1.3

./configure $XORG_CONFIG &&
make

make install

popd
rm -rf xcb-util-cursor-0.1.3
