set -eo nounset

cd /sources

test -f curl-7.55.1.tar.xz || \
wget --no-check-certificate \
	https://curl.haxx.se/download/curl-7.55.1.tar.xz

rm -rf curl-7.55.1
tar xf curl-7.55.1.tar.xz
pushd  curl-7.55.1

./configure --prefix=/usr                           \
            --disable-static                        \
            --enable-threaded-resolver              \
            --with-ca-path=/etc/ssl/certs
make

#ln -sfv ld-2.23.so.dbg /lib/ld-linux-x86-64.so.2

make install

rm -rf docs/examples/.deps

find docs \( -name Makefile\* \
          -o -name \*.1       \
          -o -name \*.3 \)    \
          -exec rm {} \;
install -v -d -m755 /usr/share/doc/curl-7.55.1
cp -v -R docs/*     /usr/share/doc/curl-7.55.1

popd
rm -rf curl-7.55.1
