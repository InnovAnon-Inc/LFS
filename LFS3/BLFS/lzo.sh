set -eo nounset

cd /sources

test -f lzo-2.10.tar.gz || \
wget --no-check-certificate \
	http://www.oberhumer.com/opensource/lzo/download/lzo-2.10.tar.gz

rm -rf lzo-2.10
tar xf lzo-2.10.tar.gz
pushd  lzo-2.10

./configure --prefix=/usr                    \
            --enable-shared                  \
            --disable-static                 \
            --docdir=/usr/share/doc/lzo-2.10
make

make install

popd
rm -rf lzo-2.10
