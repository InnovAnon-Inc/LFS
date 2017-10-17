set -eo nounset

cd /sources

test -f dbus-glib-0.108.tar.gz || \
wget --no-check-certificate \
	https://dbus.freedesktop.org/releases/dbus-glib/dbus-glib-0.108.tar.gz

rm -rf dbus-glib-0.108
tar xf dbus-glib-0.108.tar.gz
pushd  dbus-glib-0.108

./configure --prefix=/usr     \
            --sysconfdir=/etc \
            --disable-static &&
make

make install

popd
rm -rf dbus-glib-0.108
