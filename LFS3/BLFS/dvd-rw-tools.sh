set -eo nounset

cd /sources

test -f dvd+rw-tools-7.1.tar.gz || \
wget --no-check-certificate \
	http://fy.chalmers.se/~appro/linux/DVD+RW/tools/dvd+rw-tools-7.1.tar.gz

rm -rf dvd+rw-tools-7.1
tar xf dvd+rw-tools-7.1.tar.gz
pushd  dvd+rw-tools-7.1

sed -i '/stdlib/a #include <limits.h>' transport.hxx &&
make all rpl8 btcflash

make prefix=/usr install &&
install -v -m644 -D index.html \
    /usr/share/doc/dvd+rw-tools-7.1/index.html

popd
rm -rf dvd+rw-tools-7.1
