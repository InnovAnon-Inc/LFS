set -eo nounset

cd /sources

test -f libpcap-1.8.1.tar.gz || \
wget --no-check-certificate \
	http://www.tcpdump.org/release/libpcap-1.8.1.tar.gz

test -f libpcap-1.8.1-enable_bluetooth-1.patch || \
wget --no-check-certificate \
	http://www.linuxfromscratch.org/patches/blfs/svn/libpcap-1.8.1-enable_bluetooth-1.patch

rm -rf libpcap-1.8.1
tar xf libpcap-1.8.1.tar.gz
pushd  libpcap-1.8.1

patch -Np1 -i ../libpcap-1.8.1-enable_bluetooth-1.patch

./configure --prefix=/usr
make

sed -i '/INSTALL_DATA.*libpcap.a\|RANLIB.*libpcap.a/ s/^/#/' Makefile

make install

popd
rm -rf libpcap-1.8.1
