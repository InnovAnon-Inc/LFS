set -eo nounset

cd /sources

test -f R-3.4.2.tar.gz || \
wget --no-check-certificate \
	http://ftp.osuosl.org/pub/cran/src/base/R-3/R-3.4.2.tar.gz

rm -rf R-3.4.2
tar xf R-3.4.2.tar.gz
pushd R-3.4.2

./configure --enable-R-shlib \
	--enable-R-static-lib \
	--enable-BLAS-shlib \
	--enable-lto \
	--enable-static \
	--enable-shared
make
make install

popd
rm -rf R-3.4.2
