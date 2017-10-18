set -eo nounset

cd /sources

test -f ijs-0.35.tar.bz2 || \
wget --no-check-certificate \
	https://www.openprinting.org/download/ijs/download/ijs-0.35.tar.bz2

rm -rf ijs-0.35
tar xf ijs-0.35.tar.bz2
pushd  ijs-0.35

./configure --prefix=/usr \
            --mandir=/usr/share/man \
            --enable-shared \
            --disable-static &&
make

make install

popd
rm -rf ijs-0.35
