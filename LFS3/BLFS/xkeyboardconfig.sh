set -eo nounset

cd /sources

test -f xkeyboard-config-2.22.tar.bz2 || \
wget --no-check-certificate \
	https://www.x.org/pub/individual/data/xkeyboard-config/xkeyboard-config-2.22.tar.bz2

rm -rf xkeyboard-config-2.22
tar xf xkeyboard-config-2.22.tar.bz2
pushd  xkeyboard-config-2.22

./configure $XORG_CONFIG --with-xkb-rules-symlink=xorg &&
make

make install

popd
rm -rf xkeyboard-config-2.22
