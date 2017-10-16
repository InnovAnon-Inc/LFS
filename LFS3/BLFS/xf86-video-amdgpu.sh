set -eo nounset

cd /sources

test -f xf86-video-amdgpu-1.4.0.tar.gz || \
wget --no-check-certificate \
	https://www.x.org/pub/individual/driver/xf86-video-amdgpu-1.4.0.tar.gz

rm -rf xf86-video-amdgpu-1.4.0
tar xf xf86-video-amdgpu-1.4.0.tar.gz
pushd  xf86-video-amdgpu-1.4.0

# TODO put on one line
#CONFIG_EXTRA_FIRMWARE="amdgpu/topaz_ce.bin amdgpu/topaz_k_smc.bin amdgpu/topaz_mc.bin
#                       amdgpu/topaz_me.bin amdgpu/topaz_mec2.bin amdgpu/topaz_mec.bin
#                       amdgpu/topaz_pfp.bin amdgpu/topaz_rlc.bin amdgpu/topaz_sdma1.bin
#                       amdgpu/topaz_sdma.bin amdgpu/topaz_smc.bin rtl_nic/rtl8168e-3.fw"
#CONFIG_EXTRA_FIRMWARE_DIR="/lib/firmware"

#Alternatively, if you change CONFIG_DRM_AMDGPU to '=m' in your linux kernel .config the firmware can be loaded automatically from /lib/firmware/amdgpu/ 

./configure $XORG_CONFIG &&
make

make install

popd
rm -rf xf86-video-amdgpu-1.4.0
