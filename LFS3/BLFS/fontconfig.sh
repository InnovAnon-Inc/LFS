set -eo nounset

cd /sources

test -f fontconfig-2.12.6.tar.bz2 || \
wget --no-check-certificate \
	https://www.freedesktop.org/software/fontconfig/release/fontconfig-2.12.6.tar.bz2

rm -rf fontconfig-2.12.6
tar xf fontconfig-2.12.6.tar.bz2
pushd  fontconfig-2.12.6

rm -f src/fcobjshash.h

./configure --prefix=/usr        \
            --sysconfdir=/etc    \
            --localstatedir=/var \
            --disable-docs       \
            --docdir=/usr/share/doc/fontconfig-2.12.6
make

make install

install -v -dm755 \
        /usr/share/{man/man{1,3,5},doc/fontconfig-2.12.6/fontconfig-devel}
install -v -m644 fc-*/*.1         /usr/share/man/man1
install -v -m644 doc/*.3          /usr/share/man/man3
install -v -m644 doc/fonts-conf.5 /usr/share/man/man5
install -v -m644 doc/fontconfig-devel/* \
                                  /usr/share/doc/fontconfig-2.12.6/fontconfig-devel
install -v -m644 doc/*.{pdf,sgml,txt,html} \
                                  /usr/share/doc/fontconfig-2.12.6

popd
rm -rf fontconfig-2.12.6
