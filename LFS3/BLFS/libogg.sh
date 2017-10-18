set -eo nounset

cd /sources

test -f libogg-1.3.2.tar.xz || \
wget --no-check-certificate \
	https://downloads.xiph.org/releases/ogg/libogg-1.3.2.tar.xz

rm -rf libogg-1.3.2
tar xf libogg-1.3.2.tar.xz
pushd  libogg-1.3.2

./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/libogg-1.3.2 &&
make

make install

popd
rm -rf libogg-1.3.2
