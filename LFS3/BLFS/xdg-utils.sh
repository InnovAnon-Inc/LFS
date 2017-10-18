set -eo nounset

cd /sources

test -f xdg-utils-1.1.2.tar.gz || \
wget --no-check-certificate \
	https://portland.freedesktop.org/download/xdg-utils-1.1.2.tar.gz

rm -rf xdg-utils-1.1.2
tar xf xdg-utils-1.1.2.tar.gz
pushd  xdg-utils-1.1.2

./configure --prefix=/usr --mandir=/usr/share/man &&
make

make install

popd
rm -rf xdg-utils-1.1.2
