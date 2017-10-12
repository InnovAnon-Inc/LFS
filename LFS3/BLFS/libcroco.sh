set -eo nounset

cd /sources

test -f libcroco-0.6.12.tar.xz || \
wget --no-check-certificate \
	http://ftp.gnome.org/pub/gnome/sources/libcroco/0.6/libcroco-0.6.12.tar.xz

rm -rf libcroco-0.6.12
tar xf libcroco-0.6.12.tar.xz
pushd  libcroco-0.6.12

./configure --prefix=/usr --disable-static
make

make install

popd
rm -rf libcroco-0.6.12
