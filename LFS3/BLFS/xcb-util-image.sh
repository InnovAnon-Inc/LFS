set -eo nounset

cd /sources

test -f xcb-util-image-0.4.0.tar.bz2 || \
wget --no-check-certificate \
	https://xcb.freedesktop.org/dist/xcb-util-image-0.4.0.tar.bz2

rm -rf xcb-util-image-0.4.0
tar xf xcb-util-image-0.4.0.tar.bz2
pushd  xcb-util-image-0.4.0

./configure $XORG_CONFIG &&
make

make install

popd
rm -rf xcb-util-image-0.4.0
