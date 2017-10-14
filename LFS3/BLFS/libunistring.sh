set -eo nounset

cd /sources

test -f libunistring-0.9.7.tar.xz || \
wget --no-check-certificate \
	https://ftp.gnu.org/gnu/libunistring/libunistring-0.9.7.tar.xz

rm -rf libunistring-0.9.7
tar xf libunistring-0.9.7.tar.xz
pushd  libunistring-0.9.7

./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/libunistring-0.9.7
make

make install

popd
rm -rf libunistring-0.9.7

