set -eo nounset

cd /sources

test -f expect5.45.tar.gz || \
wget --no-check-certificate \
	https://downloads.sourceforge.net/expect/expect5.45.tar.gz

rm -rf expect5.45
tar xf expect5.45.tar.gz
pushd  expect5.45

./configure --prefix=/usr           \
            --with-tcl=/usr/lib     \
            --enable-shared         \
            --mandir=/usr/share/man \
            --with-tclinclude=/usr/include &&
make

make install &&
ln -svf expect5.45/libexpect5.45.so /usr/lib

popd
rm -rf expect5.45
