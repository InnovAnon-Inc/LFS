set -eo nounset

cd /sources

test -f pcre2-10.30.tar.bz2 || \
wget --no-check-certificate \
	http://downloads.sourceforge.net/pcre/pcre2-10.30.tar.bz2

rm -rf pcre2-10.30
tar xf pcre2-10.30.tar.bz2
pushd  pcre2-10.30

./configure --prefix=/usr                       \
            --docdir=/usr/share/doc/pcre2-10.30 \
            --enable-unicode                    \
            --enable-pcre2-16                   \
            --enable-pcre2-32                   \
            --enable-pcre2grep-libz             \
            --enable-pcre2grep-libbz2           \
            --enable-pcre2test-libreadline      \
            --disable-static                    &&
make

make install

popd
rm -rf pcre2-10.30
