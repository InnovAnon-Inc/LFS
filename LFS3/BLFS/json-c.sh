set -eo nounset

cd /sources

test -f json-c-0.12.1.tar.gz || \
wget --no-check-certificate \
	https://s3.amazonaws.com/json-c_releases/releases/json-c-0.12.1.tar.gz

rm -rf json-c-0.12.1
tar xf json-c-0.12.1.tar.gz
pushd  json-c-0.12.1

sed -i s/-Werror// Makefile.in tests/Makefile.in &&
./configure --prefix=/usr --disable-static       &&
make -j1

make install

popd
rm -rf json-c-0.12.1
