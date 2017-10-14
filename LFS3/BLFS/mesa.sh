set -eo nounset

cd /sources

for k in \
https://mesa.freedesktop.org/archive/13.0.4/mesa-13.0.4.tar.xz \
http://www.linuxfromscratch.org/patches/blfs/8.0/mesa-13.0.4-add_xdemos-1.patch ; do
test -f `basename $k` || \
wget --no-check-certificate \
	$k
done

rm -rf mesa-13.0.4
tar xf mesa-13.0.4.tar.xz
pushd  mesa-13.0.4

patch -Np1 -i ../mesa-13.0.4-add_xdemos-1.patch

GLL_DRV="i915,r600,nouveau,radeonsi,svga,swrast"

sed -i "/pthread_stubs_possible=/s/yes/no/" configure.ac

./autogen.sh CFLAGS='-O2' CXXFLAGS='-O2'    \
            --prefix=$XORG_PREFIX           \
            --sysconfdir=/etc               \
            --enable-texture-float          \
            --enable-osmesa                 \
            --enable-xa                     \
            --enable-glx-tls                \
            --with-egl-platforms="drm,x11"  \
            --with-gallium-drivers=$GLL_DRV

unset GLL_DRV

make

make -C xdemos DEMOS_PREFIX=$XORG_PREFIX

make install

make -C xdemos DEMOS_PREFIX=$XORG_PREFIX install

install -v -dm755 /usr/share/doc/mesa-13.0.4
cp -rfv docs/* /usr/share/doc/mesa-13.0.4

popd
rm -rf mesa-13.0.4

