set -eo nounset

cd /sources

test -f smartmontools-6.5.tar.gz || \
wget --no-check-certificate \
	https://downloads.sourceforge.net/smartmontools/smartmontools-6.5.tar.gz

rm -rf smartmontools-6.5
tar xf smartmontools-6.5.tar.gz
pushd  smartmontools-6.5

./configure --prefix=/usr           \
            --sysconfdir=/etc       \
            --with-initscriptdir=no \
            --docdir=/usr/share/doc/smartmontools-6.5 &&
make

make install

/workspace/LFS/LFS3/BLFS/bootscripts.sh smartd

popd
rm -rf smartmontools-6.5
