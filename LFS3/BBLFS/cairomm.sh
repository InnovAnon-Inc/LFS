set -eo nounset

cd /sources

test -f cairomm-1.15.5.tar.gz || \
wget --no-check-certificate \
	https://www.cairographics.org/releases/cairomm-1.15.5.tar.gz

rm -rf cairomm-1.15.5
tar xf cairomm-1.15.5.tar.gz
pushd  cairomm-1.15.5

./configure --prefix=/usr    \
            --disable-static \
            --enable-tee
make

make install

popd
rm -rf cairomm-1.15.5
