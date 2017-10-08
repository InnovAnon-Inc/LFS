cd /sources

test -f libgpg-error-1.27.tar.bz2 || \
wget --no-check-certificate \
	https://www.gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.27.tar.bz2

rm -rf libgpg-error-1.27
tar xf libgpg-error-1.27.tar.bz2
cd     libgpg-error-1.27

./configure --prefix=/usr
make

make install
install -v -m644 -D README /usr/share/doc/libgpg-error-1.27/README
