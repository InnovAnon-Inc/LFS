set -eo nounset

cd /sources

test -f libXdmcp-1.1.2.tar.bz2 || \
wget --no-check-certificate \
	https://www.x.org/pub/individual/lib/libXdmcp-1.1.2.tar.bz2

rm -rf libXdmcp-1.1.2
tar xf libXdmcp-1.1.2.tar.bz2
pushd  libXdmcp-1.1.2

./configure $XORG_CONFIG
make

make install

popd
rm -rf libXdmcp-1.1.2
