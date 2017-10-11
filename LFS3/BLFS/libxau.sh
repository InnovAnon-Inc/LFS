set -eo nounset

cd /sources

test -f libXau-1.0.8.tar.bz2 || \
wget --no-check-certificate \
	https://www.x.org/pub/individual/lib/libXau-1.0.8.tar.bz2

rm -rf libXau-1.0.8
tar xf libXau-1.0.8.tar.bz2
pushd  libXau-1.0.8

./configure $XORG_CONFIG
make

make install

popd
rm -rf libXau-1.0.8
