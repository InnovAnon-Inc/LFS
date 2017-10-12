set -eo nounset

cd /sources

test -f pango-1.40.12.tar.xz || \
wget --no-check-certificate \
	http://ftp.gnome.org/pub/gnome/sources/pango/1.40/pango-1.40.12.tar.xz

rm -rf pango-1.40.12
tar xf pango-1.40.12.tar.xz
pushd  pango-1.40.12

./configure --prefix=/usr --sysconfdir=/etc
make

make install

popd
rm -rf pango-1.40.12
