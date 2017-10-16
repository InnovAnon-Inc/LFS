set -eo nounset

cd /sources

test -f pm-utils-1.4.1.tar.gz || \
wget --no-check-certificate \
	https://pm-utils.freedesktop.org/releases/pm-utils-1.4.1.tar.gz

rm -rf pm-utils-1.4.1
tar xf pm-utils-1.4.1.tar.gz
pushd  pm-utils-1.4.1

./configure --prefix=/usr     \
            --sysconfdir=/etc \
            --docdir=/usr/share/doc/pm-utils-1.4.1 &&
make

make install

install -v -m644 man/*.1 /usr/share/man/man1 &&
install -v -m644 man/*.8 /usr/share/man/man8 &&
ln -sv pm-action.8 /usr/share/man/man8/pm-suspend.8 &&
ln -sv pm-action.8 /usr/share/man/man8/pm-hibernate.8 &&
ln -sv pm-action.8 /usr/share/man/man8/pm-suspend-hybrid.8

popd
rm -rf pm-utils-1.4.1
