set -eo nounset

cd /sources

test -f libgsf-1.14.41.tar.xz || \
wget --no-check-certificate \
	 http://ftp.gnome.org/pub/gnome/sources/libgsf/1.14/libgsf-1.14.41.tar.xz

rm -rf libgsf-1.14.41
tar xf libgsf-1.14.41.tar.xz
pushd  libgsf-1.14.41

./configure --prefix=/usr --disable-static &&
make

make install

popd
rm -rf libgsf-1.14.41
