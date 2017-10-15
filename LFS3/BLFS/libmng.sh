set -eo nounset

cd /sources

test -f libmng-2.0.3.tar.xz || \
wget --no-check-certificate \
	 https://downloads.sourceforge.net/libmng/libmng-2.0.3.tar.xz

rm -rf libmng-2.0.3
tar xf libmng-2.0.3.tar.xz
pushd  libmng-2.0.3

./configure --prefix=/usr --disable-static
make

make install

install -v -m755 -d        /usr/share/doc/libmng-2.0.3
install -v -m644 doc/*.txt /usr/share/doc/libmng-2.0.3

popd
rm -rf libmng-2.0.3

