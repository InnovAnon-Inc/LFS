set -eo nounset

cd /sources

test -f wayland-protocols-1.10.tar.xz || \
wget --no-check-certificate \
	 https://wayland.freedesktop.org/releases/wayland-protocols-1.10.tar.xz

rm -rf wayland-protocols-1.10
tar xf wayland-protocols-1.10.tar.xz
pushd  wayland-protocols-1.10

./configure --prefix=/usr &&
make

make install

popd
rm -rf wayland-protocols-1.10
