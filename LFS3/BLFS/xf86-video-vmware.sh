set -eo nounset

cd /sources

test -f xf86-video-vmware-13.2.1.tar.bz2 || \
wget --no-check-certificate \
	https://www.x.org/pub/individual/driver/xf86-video-vmware-13.2.1.tar.bz2

rm -rf xf86-video-vmware-13.2.1
tar xf xf86-video-vmware-13.2.1.tar.bz2
pushd  xf86-video-vmware-13.2.1

./configure $XORG_CONFIG &&
make

make install

popd
rm -rf xf86-video-vmware-13.2.1
