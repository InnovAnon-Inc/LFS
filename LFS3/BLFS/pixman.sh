set -eo nounset

cd /sources

test -f pixman-0.34.0.tar.gz || \
wget --no-check-certificate \
	https://www.cairographics.org/releases/pixman-0.34.0.tar.gz

rm -rf pixman-0.34.0
tar xf pixman-0.34.0.tar.gz
pushd  pixman-0.34.0

./configure --prefix=/usr --disable-static
make

make install

popd
rm -rf pixman-0.34.0

