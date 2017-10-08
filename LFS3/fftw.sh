cd /sources

test -f fftw-3.3.6-pl2.tar.gz || \
wget --no-check-certificate \
	http://www.fftw.org/fftw-3.3.6-pl2.tar.gz

rm -rf fftw-3.3.6-pl2
tar xf fftw-3.3.6-pl2.tar.gz
cd fftw-3.3.6-pl2

./configure --prefix=/usr  --enable-shared --enable-threads &&
make

make install
