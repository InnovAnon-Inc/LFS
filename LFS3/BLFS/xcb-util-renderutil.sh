set -eo nounset

cd /sources

test -f xcb-util-renderutil-0.3.9.tar.bz2 || \
wget --no-check-certificate \
	https://xcb.freedesktop.org/dist/xcb-util-renderutil-0.3.9.tar.bz2

rm -rf xcb-util-renderutil-0.3.9
tar xf xcb-util-renderutil-0.3.9.tar.bz2
pushd  xcb-util-renderutil-0.3.9

./configure $XORG_CONFIG &&
make

make install

popd
rm -rf xcb-util-renderutil-0.3.9
