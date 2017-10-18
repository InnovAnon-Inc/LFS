set -eo nounset

cd /sources

test -f libburn-1.4.8.tar.gz || \
wget --no-check-certificate \
	http://files.libburnia-project.org/releases/libburn-1.4.8.tar.gz

rm -rf libburn-1.4.8
tar xf libburn-1.4.8.tar.gz
pushd  libburn-1.4.8

./configure --prefix=/usr --disable-static &&
make

make install

popd
rm -rf libburn-1.4.8
