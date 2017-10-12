set -eo nounset

cd /sources

test -f links-2.14.tar.bz2 || \
wget --no-check-certificate \
	http://links.twibright.com/download/links-2.14.tar.bz2

rm -rf links-2.14
tar xf links-2.14.tar.bz2
pushd  links-2.14

./configure --prefix=/usr --mandir=/usr/share/man
make

make install
install -v -d -m755 /usr/share/doc/links-2.14
install -v -m644 doc/links_cal/* KEYS BRAILLE_HOWTO \
    /usr/share/doc/links-2.14

popd
rm -rf links-2.14