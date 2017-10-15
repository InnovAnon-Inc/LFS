set -eo nounset

cd /sources

test -f libexif-0.6.21.tar.bz2 || \
wget --no-check-certificate \
	https://downloads.sourceforge.net/libexif/libexif-0.6.21.tar.bz2

rm -rf libexif-0.6.21
tar xf libexif-0.6.21.tar.bz2
pushd  libexif-0.6.21

./configure --prefix=/usr \
            --with-doc-dir=/usr/share/doc/libexif-0.6.21 \
            --disable-static
make

make install

popd
rm -rf libexif-0.6.21

