set -eo nounset

cd /sources

test -f gcr-3.20.0.tar.xz || \
wget --no-check-certificate \
	http://ftp.gnome.org/pub/gnome/sources/gcr/3.20/gcr-3.20.0.tar.xz

rm -rf gcr-3.20.0
tar xf gcr-3.20.0.tar.xz
pushd  gcr-3.20.0

sed -i -r 's:"(/desktop):"/org/gnome\1:' schema/*.xml &&

./configure --prefix=/usr     \
            --sysconfdir=/etc &&
make

make install

popd
rm -rf gcr-3.20.0
