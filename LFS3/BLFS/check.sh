set -eo nounset

cd /sources

test -f check-0.11.0.tar.gz || \
wget --no-check-certificate \
	https://github.com/libcheck/check/releases/download/0.11.0/check-0.11.0.tar.gz

rm -rf check-0.11.0
tar xf check-0.11.0.tar.gz
pushd  check-0.11.0

./configure --prefix=/usr --disable-static &&
make

make docdir=/usr/share/doc/check-0.11.0 install

popd
rm -rf check-0.11.0

