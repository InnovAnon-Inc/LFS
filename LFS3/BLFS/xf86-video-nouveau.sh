set -eo nounset

cd /sources

test -f xf86-video-nouveau-1.0.15.tar.bz2 || \
wget --no-check-certificate \
	https://www.x.org/pub/individual/driver/xf86-video-nouveau-1.0.15.tar.bz2

rm -rf xf86-video-nouveau-1.0.15
tar xf xf86-video-nouveau-1.0.15.tar.bz2
pushd  xf86-video-nouveau-1.0.15

./configure $XORG_CONFIG &&
make

make install

# TODO see note about non-Maxwell GPUs
#cat >> /etc/X11/xorg.conf.d/nvidia.conf << "EOF"
#Section "Device"
#        Identifier "nvidia"
#        Driver "nouveau"
#        Option "AccelMethod" "glamor"
#EndSection
#EOF

popd
rm -rf xf86-video-nouveau-1.0.15
