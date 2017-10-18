set -eo nounset

cd /sources

test -f libvorbis-1.3.5.tar.xz || \
wget --no-check-certificate \
	https://downloads.xiph.org/releases/vorbis/libvorbis-1.3.5.tar.xz

rm -rf libvorbis-1.3.5
tar xf libvorbis-1.3.5.tar.xz
pushd  libvorbis-1.3.5

sed -i '/components.png \\/{n;d}' doc/Makefile.in

./configure --prefix=/usr --disable-static &&
make

make install &&
install -v -m644 doc/Vorbis* /usr/share/doc/libvorbis-1.3.5

popd
rm -rf libvorbis-1.3.5
