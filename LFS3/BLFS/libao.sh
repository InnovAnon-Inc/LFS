set -eo nounset

cd /sources

test -f libao-1.2.0.tar.gz || \
wget --no-check-certificate \
	https://downloads.xiph.org/releases/ao/libao-1.2.0.tar.gz

rm -rf libao-1.2.0
tar xf libao-1.2.0.tar.gz
pushd  libao-1.2.0

./configure --prefix=/usr &&
make

make install &&
install -v -m644 README /usr/share/doc/libao-1.2.0

popd
rm -rf libao-1.2.0
