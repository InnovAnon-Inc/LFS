# requires libgpg-error
cd /sources

test -f libgcrypt-1.8.1.tar.bz2 || \
wget --no-check-certificate \
     https://www.gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.8.1.tar.bz2

rm -rf libgcrypt-1.8.1
tar xf libgcrypt-1.8.1.tar.bz2
cd     libgcrypt-1.8.1

./configure --prefix=/usr
make

make -C doc pdf ps html
makeinfo --html --no-split -o doc/gcrypt_nochunks.html doc/gcrypt.texi
makeinfo --plaintext       -o doc/gcrypt.txt           doc/gcrypt.texi

make install
install -v -dm755   /usr/share/doc/libgcrypt-1.8.1
install -v -m644    README doc/{README.apichanges,fips*,libgcrypt*} \
                    /usr/share/doc/libgcrypt-1.8.1

install -v -dm755   /usr/share/doc/libgcrypt-1.8.1/html
install -v -m644 doc/gcrypt.html/* \
                    /usr/share/doc/libgcrypt-1.8.1/html
install -v -m644 doc/gcrypt_nochunks.html \
                    /usr/share/doc/libgcrypt-1.8.1
install -v -m644 doc/gcrypt.{pdf,ps,dvi,txt,texi} \
                    /usr/share/doc/libgcrypt-1.8.1
