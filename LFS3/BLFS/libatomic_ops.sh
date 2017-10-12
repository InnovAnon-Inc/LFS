set -eo nounset

cd /sources

test -f libatomic_ops-7.4.6.tar.gz || \
wget --no-check-certificate \
	https://github.com/ivmai/libatomic_ops/releases/download/v7.4.6/libatomic_ops-7.4.6.tar.gz

rm -rf libatomic_ops-7.4.6
tar xf libatomic_ops-7.4.6.tar.gz
pushd  libatomic_ops-7.4.6

./configure --prefix=/usr    \
            --enable-shared  \
            --disable-static \
            --docdir=/usr/share/doc/libatomic_ops-7.4.6 &&
make

make install

popd
rm -rf libatomic_ops-7.4.6
