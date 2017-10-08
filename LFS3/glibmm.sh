cd /sources

test -f glibmm-2.54.1.tar.xz || \
wget --no-check-certificate \
	http://ftp.gnome.org/pub/gnome/sources/glibmm/2.54/glibmm-2.54.1.tar.xz

rm -rf glibmm-2.54.1
tar xf glibmm-2.54.1.tar.xz
cd glibmm-2.54.1

sed -e '/^libdocdir =/ s/$(book_name)/glibmm-2.54.1/' \
    -i docs/Makefile.in

./configure --prefix=/usr &&
make

make install
