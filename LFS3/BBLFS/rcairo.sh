set -eo nounset

cd /sources

test -f rcairo-1.15.5.tar.gz || \
wget --no-check-certificate \
	https://www.cairographics.org/releases/rcairo-1.15.5.tar.gz

rm -rf rcairo-1.15.5
tar xf rcairo-1.15.5.tar.gz
pushd  rcairo-1.15.5

./configure --prefix=/usr    \
            --disable-static \
            --enable-tee
make

make install

popd
rm -rf rcairo-1.15.5
