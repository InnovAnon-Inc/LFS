set -eo nounset

cd /sources

test -f wayland-1.14.0.tar.xz || \
wget --no-check-certificate \
	https://wayland.freedesktop.org/releases/wayland-1.14.0.tar.xz

rm -rf wayland-1.14.0
tar xf wayland-1.14.0.tar.xz
pushd  wayland-1.14.0

./configure --prefix=/usr    \
            --disable-static \
            --disable-documentation &&
make

make install

popd
rm -rf wayland-1.14.0
