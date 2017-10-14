set -eo nounset

cd /sources

test -f libnotify-0.7.7.tar.xz || \
wget --no-check-certificate \
	http://ftp.gnome.org/pub/gnome/sources/libnotify/0.7/libnotify-0.7.7.tar.xz

rm -rf libnotify-0.7.7
tar xf libnotify-0.7.7.tar.xz
pushd  libnotify-0.7.7

./configure --prefix=/usr --disable-static
make

make install

popd
rm -rf libnotify-0.7.7
