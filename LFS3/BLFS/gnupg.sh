set -eo nounset

cd /sources

test -f gnupg-2.2.1.tar.bz2 || \
wget --no-check-certificate \
	https://www.gnupg.org/ftp/gcrypt/gnupg/gnupg-2.2.1.tar.bz2

rm -rf gnupg-2.2.1
tar xf gnupg-2.2.1.tar.bz2
pushd  gnupg-2.2.1

sed -e '/noinst_SCRIPTS = gpg-zip/c sbin_SCRIPTS += gpg-zip' \
    -i tools/Makefile.in

./configure --prefix=/usr            \
            --enable-symcryptrun     \
            --enable-maintainer-mode \
            --docdir=/usr/share/doc/gnupg-2.2.1 &&
make

if which texlive ; then
makeinfo --html --no-split \
         -o doc/gnupg_nochunks.html doc/gnupg.texi &&
makeinfo --plaintext       \
         -o doc/gnupg.txt           doc/gnupg.texi
fi

if which texlive ; then
make -C doc pdf ps html
fi

make install &&

if which texlive ; then
install -v -m755 -d /usr/share/doc/gnupg-2.2.1/html            &&
install -v -m644    doc/gnupg_nochunks.html \
                    /usr/share/doc/gnupg-2.2.1/html/gnupg.html &&
install -v -m644    doc/*.texi doc/gnupg.txt \
                    /usr/share/doc/gnupg-2.2.1
fi

if which texlive ; then
install -v -m644 doc/gnupg.html/* \
                 /usr/share/doc/gnupg-2.2.1/html &&
install -v -m644 doc/gnupg.{pdf,dvi,ps} \
                 /usr/share/doc/gnupg-2.2.1
fi

popd
rm -rf gnupg-2.2.1
