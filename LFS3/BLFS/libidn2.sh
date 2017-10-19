set -eo nounset

cd /sources

test -f libidn2-2.0.4.tar.gz || \
wget --no-check-certificate \
	https://ftp.gnu.org/gnu/libidn/libidn2-2.0.4.tar.gz

rm -rf libidn2-2.0.4
tar xf libidn2-2.0.4.tar.gz
pushd  libidn2-2.0.4

./configure --prefix=/usr --disable-static &&
make

make install

popd
rm -rf libidn2-2.0.4
