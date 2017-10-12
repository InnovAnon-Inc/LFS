set -eo nounset

cd /sources

test -f librsvg-2.40.19.tar.xz || \
wget --no-check-certificate \
	http://ftp.gnome.org/pub/gnome/sources/librsvg/2.40/librsvg-2.40.19.tar.xz

rm -rf librsvg-2.40.19
tar xf librsvg-2.40.19.tar.xz
pushd  librsvg-2.40.19

sed -i 's/ --nogtkinit//' doc/Makefile.in

./configure --prefix=/usr    \
            --enable-vala    \
            --disable-static
make

make install

popd
rm -rf librsvg-2.40.19
