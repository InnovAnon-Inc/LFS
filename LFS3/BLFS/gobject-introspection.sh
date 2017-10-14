set -eo nounset

cd /sources

test -f gobject-introspection-1.54.1.tar.xz || \
wget --no-check-certificate \
	http://ftp.gnome.org/pub/gnome/sources/gobject-introspection/1.54/gobject-introspection-1.54.1.tar.xz

rm -rf gobject-introspection-1.54.1
tar xf gobject-introspection-1.54.1.tar.xz
pushd  gobject-introspection-1.54.1

./configure --prefix=/usr --disable-static
make

make install

popd
rm -rf gobject-introspection-1.54.1
