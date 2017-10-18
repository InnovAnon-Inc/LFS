set -eo nounset

cd /sources

test -f libisofs-1.4.8.tar.gz || \
wget --no-check-certificate \
	http://files.libburnia-project.org/releases/libisofs-1.4.8.tar.gz

rm -rf libisofs-1.4.8
tar xf libisofs-1.4.8.tar.gz
pushd  libisofs-1.4.8

./configure --prefix=/usr --disable-static &&
make

make install

popd
rm -rf libisofs-1.4.8
