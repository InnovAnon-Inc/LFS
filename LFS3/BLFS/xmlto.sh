set -eo nounset

cd /sources

test -f xmlto-0.0.28.tar.bz2 || \
wget --no-check-certificate \
	https://releases.pagure.org/xmlto/xmlto-0.0.28.tar.bz2

rm -rf xmlto-0.0.28
tar xf xmlto-0.0.28.tar.bz2
pushd  xmlto-0.0.28

LINKS="/usr/bin/links" \
./configure --prefix=/usr

make

make install

rm -rf xmlto-0.0.28
popd

