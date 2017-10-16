set -eo nounset

cd /sources

test -f libvdpau-va-gl-0.4.0.tar.gz || \
wget --no-check-certificate \
	https://github.com/i-rinat/libvdpau-va-gl/archive/v0.4.0/libvdpau-va-gl-0.4.0.tar.gz

rm -rf libvdpau-va-gl-0.4.0
tar xf libvdpau-va-gl-0.4.0.tar.gz
pushd  libvdpau-va-gl-0.4.0

mkdir build &&
cd    build &&

cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$XORG_PREFIX .. &&
make

make install

echo "export VDPAU_DRIVER=va_gl" >> /etc/profile.d/xorg.sh

popd
rm -rf libvdpau-va-gl-0.4.0
