set -eo nounset

cd /sources

test -f nettle-3.3.tar.gz || \
wget --no-check-certificate \
	https://ftp.gnu.org/gnu/nettle/nettle-3.3.tar.gz

rm -rf nettle-3.3
tar xf nettle-3.3.tar.gz
pushd  nettle-3.3

./configure --prefix=/usr --disable-static
make

make install
chmod   -v   755 /usr/lib/lib{hogweed,nettle}.so
install -v -m755 -d /usr/share/doc/nettle-3.3
install -v -m644 nettle.html /usr/share/doc/nettle-3.3

popd
rm -rf nettle-3.3

