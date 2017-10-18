set -eo nounset

cd /sources

test -f xbitmaps-1.1.1.tar.bz2 || \
wget --no-check-certificate \
	https://www.x.org/pub/individual/data/xbitmaps-1.1.1.tar.bz2

rm -rf xbitmaps-1.1.1
tar xf xbitmaps-1.1.1.tar.bz2
pushd  xbitmaps-1.1.1

./configure $XORG_CONFIG

make install

popd
rm -rf xbitmaps-1.1.1
