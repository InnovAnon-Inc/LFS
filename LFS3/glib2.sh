cd /sources

test -f glib-2.54.0.tar.xz || \
wget --no-check-certificate \
	http://ftp.gnome.org/pub/gnome/sources/glib/2.54/glib-2.54.0.tar.xz

rm -rf glib-2.54.0
tar xf glib-2.54.0.tar.xz
cd glib-2.54.0

./configure --prefix=/usr --with-pcre=system &&
make

make install
