set -eo nounset

cd /sources

test -f lcms2-2.8.tar.gz || \
wget --no-check-certificate \
	http://downloads.sourceforge.net/lcms/lcms2-2.8.tar.gz

rm -rf lcms2-2.8
tar xf lcms2-2.8.tar.gz
pushd  lcms2-2.8

./configure --prefix=/usr --disable-static
make

make install

popd
rm -rf lcms2-2.8
