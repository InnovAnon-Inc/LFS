set -eo nounset

cd /sources

wget --no-check-certificate \
	http://downloads.sourceforge.net/pcre/pcre-8.41.tar.bz2

rm -rf pcre-8.41
tar xf pcre-8.41.tar.bz2
pushd pcre-8.41

./configure --prefix=/usr                     \
            --docdir=/usr/share/doc/pcre-8.41 \
            --enable-unicode-properties       \
            --enable-pcre16                   \
            --enable-pcre32                   \
            --enable-pcregrep-libz            \
            --enable-pcregrep-libbz2          \
            --enable-pcretest-libreadline     \
            --disable-static
make

make install
mv -v /usr/lib/libpcre.so.* /lib
ln -sfv ../../lib/$(readlink /usr/lib/libpcre.so) /usr/lib/libpcre.so

popd
rm -rf pcre-8.41