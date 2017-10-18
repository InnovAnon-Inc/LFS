set -eo nounset

cd /sources

test -f cdrdao-1.2.3.tar.bz2 || \
wget --no-check-certificate \
	https://downloads.sourceforge.net/cdrdao/cdrdao-1.2.3.tar.bz2

rm -rf cdrdao-1.2.3
tar xf cdrdao-1.2.3.tar.bz2
pushd  cdrdao-1.2.3

sed -i '/ioctl.h/a #include <sys/stat.h>' dao/ScsiIf-linux.cc  &&
sed -i 's/\(char .*REMOTE\)/unsigned \1/' dao/CdrDriver.{cc,h} &&

./configure --prefix=/usr --mandir=/usr/share/man &&
make

make install &&
install -v -m755 -d /usr/share/doc/cdrdao-1.2.3 &&
install -v -m644 README /usr/share/doc/cdrdao-1.2.3

popd
rm -rf cdrdao-1.2.3
