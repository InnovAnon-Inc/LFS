set -eo nounset

cd /sources

test -f libxkbcommon-0.7.2.tar.xz || \
wget --no-check-certificate \
	https://xkbcommon.org/download/libxkbcommon-0.7.2.tar.xz

rm -rf libxkbcommon-0.7.2
tar xf libxkbcommon-0.7.2.tar.xz
pushd  libxkbcommon-0.7.2

./configure $XORG_CONFIG     \
            --docdir=/usr/share/doc/libxkbcommon-0.7.2 &&
make

make install

popd
rm -rf libxkbcommon-0.7.2
