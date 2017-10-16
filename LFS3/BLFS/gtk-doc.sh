set -eo nounset

cd /sources

test -f gtk-doc-1.26.tar.xz || \
wget --no-check-certificate \
	http://ftp.gnome.org/pub/gnome/sources/gtk-doc/1.26/gtk-doc-1.26.tar.xz
rm -rf gtk-doc-1.26
tar xf gtk-doc-1.26.tar.xz
pushd  gtk-doc-1.26

./configure --prefix=/usr &&
make

make install

popd
rm -rf gtk-doc-1.26
