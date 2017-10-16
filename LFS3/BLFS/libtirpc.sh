set -eo nounset

cd /sources

test -f libtirpc-1.0.2.tar.bz2 || \
wget --no-check-certificate \
	http://downloads.sourceforge.net/libtirpc/libtirpc-1.0.2.tar.bz2

rm -rf libtirpc-1.0.2
tar xf libtirpc-1.0.2.tar.bz2
pushd  libtirpc-1.0.2

sed '/stdlib.h/a#include <stdint.h>' -i src/xdr_sizeof.c

sed '/key_secret_is/s/secret/secretkey/' -i src/libtirpc.map

./configure --prefix=/usr                                   \
            --sysconfdir=/etc                               \
            --disable-static                                \
            --disable-gssapi                                &&
make

make install &&
mv -v /usr/lib/libtirpc.so.* /lib &&
ln -sfv ../../lib/libtirpc.so.3.0.0 /usr/lib/libtirpc.so

popd
rm -rf libtirpc-1.0.2
