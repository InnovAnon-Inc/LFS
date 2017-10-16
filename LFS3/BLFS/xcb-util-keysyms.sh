set -eo nounset

cd /sources

test -f xcb-util-keysyms-0.4.0.tar.bz2 || \
wget --no-check-certificate \
	https://xcb.freedesktop.org/dist/xcb-util-keysyms-0.4.0.tar.bz2

rm -rf xcb-util-keysyms-0.4.0
tar xf xcb-util-keysyms-0.4.0.tar.bz2
pushd  xcb-util-keysyms-0.4.0

./configure $XORG_CONFIG &&
make

make install

popd
rm -rf xcb-util-keysyms-0.4.0
