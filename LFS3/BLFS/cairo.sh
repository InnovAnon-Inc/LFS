set -eo nounset

cd /sources

test -f cairo-1.14.10.tar.xz || \
wget --no-check-certificate \
	https://www.cairographics.org/releases/cairo-1.14.10.tar.xz

rm -rf cairo-1.14.10
tar xf cairo-1.14.10.tar.xz
pushd  cairo-1.14.10

./configure --prefix=/usr    \
            --disable-static \
            --enable-tee
make

make install

popd
rm -rf cairo-1.14.10
