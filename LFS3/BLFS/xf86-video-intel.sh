set -eo nounset

cd /sources

test -f xf86-video-intel-20170826.tar.xz || \
wget --no-check-certificate \
	http://anduin.linuxfromscratch.org/BLFS/xf86-video-intel/xf86-video-intel-20170826.tar.xz

rm -rf xf86-video-intel-20170826
xf86-video-intel-20170826.tar.xz
pushd  xf86-video-intel-20170826

./configure $XORG_CONFIG      \
            --enable-kms-only \
            --enable-uxa      \
            --mandir=/usr/share/man &&
make

make install &&
mv -v /usr/share/man/man4/intel-virtual-output.4 \
      /usr/share/man/man1/intel-virtual-output.1 &&
sed -i '/\.TH/s/4/1/' /usr/share/man/man1/intel-virtual-output.1

# TODO see note about upgrading
#cat >> /etc/X11/xorg.conf.d/20-intel.conf << "EOF"
#Section "Device"
#        Identifier "Intel Graphics"
#        Driver "intel"
#        Option "AccelMethod" "uxa"
#EndSection
#EOF

popd
rm -rf xf86-video-intel-20170826
