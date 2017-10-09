set -eo nounset

cd /sources

test -f libjpeg-turbo-1.5.2.tar.gz || \
wget --no-check-certificate \
	http://downloads.sourceforge.net/libjpeg-turbo/libjpeg-turbo-1.5.2.tar.gz

rm -rf libjpeg-turbo-1.5.2
tar xf libjpeg-turbo-1.5.2.tar.gz
pushd  libjpeg-turbo-1.5.2

./configure --prefix=/usr           \
            --mandir=/usr/share/man \
            --with-jpeg8            \
            --disable-static        \
            --docdir=/usr/share/doc/libjpeg-turbo-1.5.2
make

rm -f /usr/lib/libjpeg.so*

make install

popd
rm -rf libjpeg-turbo-1.5.2
