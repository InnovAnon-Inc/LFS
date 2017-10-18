set -eo nounset

cd /sources

test -f libgudev-231.tar.xz || \
wget --no-check-certificate \
	http://ftp.gnome.org/pub/gnome/sources/libgudev/231/libgudev-231.tar.xz

rm -rf libgudev-231
tar xf libgudev-231.tar.xz
pushd  libgudev-231

./configure --prefix=/usr --disable-umockdev &&
make

make install

popd
rm -rf libgudev-231
