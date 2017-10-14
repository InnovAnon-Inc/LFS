set -eo nounset

cd /sources

test -f apr-1.6.2.tar.bz2 || \
wget --no-check-certificate \
	https://archive.apache.org/dist/apr/apr-1.6.2.tar.bz2

rm -rf apr-1.6.2
tar xf apr-1.6.2.tar.bz2
pushd  apr-1.6.2

./configure --prefix=/usr    \
            --disable-static \
            --with-installbuilddir=/usr/share/apr-1/build
make

make install

popd
rm -rf apr-1.6.2

