set -eo nounset

cd /sources

test -f xf86-video-ati-7.10.0.tar.bz2 || \
wget --no-check-certificate \
	https://www.x.org/pub/individual/driver/xf86-video-ati-7.10.0.tar.bz2

rm -rf xf86-video-ati-7.10.0
tar xf xf86-video-ati-7.10.0.tar.bz2
pushd  xf86-video-ati-7.10.0

#CONFIG_EXTRA_FIRMWARE="radeon/BTC_rlc.bin radeon/CAICOS_mc.bin radeon/CAICOS_me.bin
#radeon/CAICOS_pfp.bin radeon/CAICOS_smc.bin rtl_nic/rtl8168e-3.fw"
#CONFIG_EXTRA_FIRMWARE_DIR="/lib/firmware"

#Alternatively, if you change CONFIG_DRM_RADEON to '=m' in your .config the firmware can be loaded automatically from /lib/firmware/radeon when it installs the module.

./configure $XORG_CONFIG &&
make

make install                         &&
install -v -m644 conf/10-radeon.conf \
  $XORG_PREFIX/share/X11/xorg.conf.d

popd
rm -rf xf86-video-ati-7.10.0
