set -eo nounset

cd /sources

test -f mtdev-1.1.5.tar.bz2 || \
wget --no-check-certificate \
	http://bitmath.org/code/mtdev/mtdev-1.1.5.tar.bz2

rm -rf mtdev-1.1.5
tar xf mtdev-1.1.5.tar.bz2
pushd  mtdev-1.1.5

./configure --prefix=/usr --disable-static &&
make

make install

popd
rm -rf mtdev-1.1.5
