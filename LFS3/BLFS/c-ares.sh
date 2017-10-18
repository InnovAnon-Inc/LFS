set -eo nounset

cd /sources

test -f c-ares-1.12.0.tar.gz || \
wget --no-check-certificate \
	https://c-ares.haxx.se/download/c-ares-1.12.0.tar.gz

rm -rf c-ares-1.12.0
tar xf c-ares-1.12.0.tar.gz
pushd  c-ares-1.12.0

./configure --prefix=/usr --disable-static &&
make

make install

popd
rm -rf c-ares-1.12.0
