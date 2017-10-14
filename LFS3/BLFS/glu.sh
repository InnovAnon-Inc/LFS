set -eo nounset

cd /sources

test -f glu-9.0.0.tar.bz2 || \
wget --no-check-certificate \
	ftp://ftp.freedesktop.org/pub/mesa/glu/glu-9.0.0.tar.bz2

rm -rf glu-9.0.0
tar xf glu-9.0.0.tar.bz2
pushd  glu-9.0.0

./configure --prefix=$XORG_PREFIX --disable-static
make

make install

popd
rm -rf glu-9.0.0

