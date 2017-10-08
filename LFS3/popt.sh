cd /sources

wget --no-check-certificate \
	http://rpm5.org/files/popt/popt-1.16.tar.gz

rm -rf popt-1.16
tar xf popt-1.16.tar.gz
cd popt-1.16

./configure --prefix=/usr --disable-static &&
make

make install

install -v -m755 -d /usr/share/doc/popt-1.16 &&
install -v -m644 doxygen/html/* /usr/share/doc/popt-1.16
