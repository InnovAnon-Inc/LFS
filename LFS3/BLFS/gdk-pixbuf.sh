set -eo nounset

cd /sources

test -f gdk-pixbuf-2.36.11.tar.xz || \
wget --no-check-certificate \
	http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/2.36/gdk-pixbuf-2.36.11.tar.xz

rm -rf gdk-pixbuf-2.36.11
tar xf gdk-pixbuf-2.36.11.tar.xz
pushd  gdk-pixbuf-2.36.11

./configure --prefix=/usr --with-x11
make

make install

gdk-pixbuf-query-loaders --update-cache

popd
rm -rf gdk-pixbuf-2.36.11
