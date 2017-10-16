set -eo nounset

cd /sources

test -f libnsl-1.1.0.tar.gz || \
wget --no-check-certificate \
	https://github.com/thkukuk/libnsl/archive/1.1.0/libnsl-1.1.0.tar.gz

rm -rf libnsl-1.1.0
tar xf libnsl-1.1.0.tar.gz
pushd  libnsl-1.1.0

autoreconf -fi                &&
./configure --sysconfdir=/etc &&
make

make install                  &&
mv /usr/lib/libnsl.so.2* /lib &&
ln -sfv ../../lib/libnsl.so.2.0.0 /usr/lib/libnsl.so

popd
rm -rf libnsl-1.1.0
