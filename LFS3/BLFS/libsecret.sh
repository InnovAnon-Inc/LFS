set -eo nounset

cd /sources

test -f libsecret-0.18.5.tar.xz || \
wget --no-check-certificate \
	http://ftp.gnome.org/pub/gnome/sources/libsecret/0.18/libsecret-0.18.5.tar.xz

rm -rf libsecret-0.18.5
tar xf libsecret-0.18.5.tar.xz
pushd  libsecret-0.18.5

./configure --prefix=/usr --disable-static &&
make

make install

popd
rm -rf libsecret-0.18.5
