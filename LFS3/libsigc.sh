cd /sources

test -f libsigc++-2.10.0.tar.xz || \
wget --no-check-certificate \
	http://ftp.gnome.org/pub/gnome/sources/libsigc++/2.10/libsigc++-2.10.0.tar.xz

rm -rf libsigc++-2.10.0
tar xf libsigc++-2.10.0.tar.xz
cd libsigc++-2.10.0

sed -e '/^libdocdir =/ s/$(book_name)/libsigc++-2.10.0/' -i docs/Makefile.in

./configure --prefix=/usr &&
make

make install
