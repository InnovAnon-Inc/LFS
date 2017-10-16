set -eo nounset

cd /sources

test -f libvdpau-1.1.1.tar.bz2 || \
wget --no-check-certificate \
	https://people.freedesktop.org/~aplattner/vdpau/libvdpau-1.1.1.tar.bz2

rm -rf libvdpau-1.1.1
tar xf libvdpau-1.1.1.tar.bz2
pushd  libvdpau-1.1.1

./configure $XORG_CONFIG \
            --docdir=/usr/share/doc/libvdpau-1.1.1 &&
make

make install

popd
rm -rf libvdpau-1.1.1
