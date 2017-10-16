set -eo nounset

cd /sources

test -f rpcsvc-proto-1.2.tar.gz || \
wget --no-check-certificate \
	https://github.com/thkukuk/rpcsvc-proto/archive/rpcsvc-proto-1.2.tar.gz

rm -rf rpcsvc-proto-rpcsvc-proto-1.2
tar xf rpcsvc-proto-1.2.tar.gz
pushd  rpcsvc-proto-rpcsvc-proto-1.2

autoreconf -fi                &&
./configure --sysconfdir=/etc &&
make

make install

popd
rm -rf rpcsvc-proto-rpcsvc-proto-1.2
