set -eo nounset

cd /sources

test -f libisoburn-1.4.8.tar.gz || \
wget --no-check-certificate \
	http://files.libburnia-project.org/releases/libisoburn-1.4.8.tar.gz

rm -rf libisoburn-1.4.8
tar xf libisoburn-1.4.8.tar.gz
pushd  libisoburn-1.4.8

./configure --prefix=/usr              \
            --disable-static           \
            --enable-pkg-check-modules &&
make

if which doxygen  ; then
doxygen doc/doxygen.conf
fi

make install

if which doxygen  ; then
install -v -dm755 /usr/share/doc/libisoburn-1.4.8 &&
install -v -m644 doc/html/* /usr/share/doc/libisoburn-1.4.8
fi

popd
rm -rf libisoburn-1.4.8
