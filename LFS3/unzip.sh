cd /sources

test -f unzip60.tar.gz || \
wget --no-check-certificate \
	http://downloads.sourceforge.net/infozip/unzip60.tar.gz

rm -rf unzip60
tar xf unzip60.tar.gz
cd unzip60

make -f unix/Makefile generic

make prefix=/usr MANDIR=/usr/share/man/man1 \
 -f unix/Makefile install
