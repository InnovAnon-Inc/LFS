cd /sources

test -f elfutils-0.170.tar.bz2 || \
wget --no-check-certificate \
	https://sourceware.org/ftp/elfutils/0.170/elfutils-0.170.tar.bz2

rm -rf elfutils-0.170
tar xf elfutils-0.170.tar.bz2
cd elfutils-0.170

./configure --prefix=/usr --program-prefix="eu-"
make

make install
