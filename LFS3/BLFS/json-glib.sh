set -eo nounset

cd /sources

test -f json-glib-1.2.8.tar.xz || \
wget --no-check-certificate \
	http://ftp.gnome.org/pub/gnome/sources/json-glib/1.2/json-glib-1.2.8.tar.xz

rm -rf json-glib-1.2.8
tar xf json-glib-1.2.8.tar.xz
pushd  json-glib-1.2.8

./configure --prefix=/usr &&
make

make install

popd
rm -rf json-glib-1.2.8
