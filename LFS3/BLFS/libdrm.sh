set -eo nounset

cd /sources

test -f libdrm-2.4.84.tar.bz2 || \
wget --no-check-certificate \
	http://dri.freedesktop.org/libdrm/libdrm-2.4.84.tar.bz2

rm -rf libdrm-2.4.84
tar xf libdrm-2.4.84.tar.bz2
pushd  libdrm-2.4.84

./configure --prefix=/usr --enable-udev
make

make install

popd
rm -rf libdrm-2.4.84

