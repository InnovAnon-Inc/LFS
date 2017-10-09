set -eo nounset

cd /sources

test -f libsigsegv-2.11.tar.gz || \
wget --no-check-certificate \
	https://ftp.gnu.org/gnu/libsigsegv/libsigsegv-2.11.tar.gz

rm -rf libsigsegv-2.11
tar xf libsigsegv-2.11.tar.gz
pushd  libsigsegv-2.11

./configure --prefix=/usr   \
            --enable-shared \
            --disable-static &&
make

make install

popd
rm -rf libsigsegv-2.11
