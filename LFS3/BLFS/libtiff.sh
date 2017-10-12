set -eo nounset

cd /sources

test -f tiff-4.0.8.tar.gz || \
wget --no-check-certificate \
	http://download.osgeo.org/libtiff/tiff-4.0.8.tar.gz

rm -rf tiff-4.0.8
tar xf tiff-4.0.8.tar.gz
pushd  tiff-4.0.8

./configure --prefix=/usr --disable-static
make

make install

popd
rm -rf tiff-4.0.8
