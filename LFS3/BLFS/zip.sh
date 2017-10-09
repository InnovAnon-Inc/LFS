set -eo nounset

cd /sources

test -f zip30.tar.gz || \
wget --no-check-certificate \
	http://downloads.sourceforge.net/infozip/zip30.tar.gz

rm -rf zip30
tar xf zip30.tar.gz
pushd zip30

make -f unix/Makefile generic_gcc

make prefix=/usr MANDIR=/usr/share/man/man1 -f unix/Makefile install

popd
rm -rf zip30
