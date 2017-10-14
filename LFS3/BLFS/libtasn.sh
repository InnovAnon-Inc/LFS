set -eo nounset

cd /sources

test -f libtasn1-4.12.tar.gz || \
wget --no-check-certificate \
	https://ftp.gnu.org/gnu/libtasn1/libtasn1-4.12.tar.gz

rm -rf libtasn1-4.12
tar xf libtasn1-4.12.tar.gz
pushd  libtasn1-4.12

./configure --prefix=/usr --disable-static
make

make install

make -C doc/reference install-data-local

popd
rm -rf libtasn1-4.12
