set -eo nounset

cd /sources

test -f apr-util-1.6.0.tar.bz2 || \
wget --no-check-certificate \
	https://archive.apache.org/dist/apr/apr-util-1.6.0.tar.bz2

rm -rf apr-util-1.6.0
tar xf apr-util-1.6.0.tar.bz2
pushd  apr-util-1.6.0

./configure --prefix=/usr       \
            --with-apr=/usr     \
            --with-gdbm=/usr    \
            --with-openssl=/usr \
            --with-crypto
make

make install

popd
rm -rf apr-util-1.6.0

