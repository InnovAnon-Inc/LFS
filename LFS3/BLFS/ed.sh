set -eo nounset

cd /sources

test -f ed-1.14.2.tar.lz || \
wget --no-check-certificate \
	https://ftp.gnu.org/gnu/ed/ed-1.14.2.tar.lz

rm -rf ed-1.14.2
tar xf ed-1.14.2.tar.lz
pushd  ed-1.14.2

./configure --prefix=/usr --bindir=/bin &&
make

make install

popd
rm -rf ed-1.14.2
