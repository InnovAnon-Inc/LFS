set -eo nounset

cd /sources

test -f harfbuzz-1.5.1.tar.bz2 || \
wget --no-check-certificate \
	https://www.freedesktop.org/software/harfbuzz/release/harfbuzz-1.5.1.tar.bz2

rm -rf harfbuzz-1.5.1
tar xf harfbuzz-1.5.1.tar.bz2
pushd  harfbuzz-1.5.1

./configure --prefix=/usr --with-gobject
make

make install

popd
rm -rf harfbuzz-1.5.1
