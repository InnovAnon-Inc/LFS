cd /sources

test -f tcc-0.9.26.tar.bz2 || \
wget --no-check-certificate \
	https://download.savannah.gnu.org/releases/tinycc/tcc-0.9.26.tar.bz2

rm -rf tcc-0.9.26
tar xf tcc-0.9.26.tar.bz2
cd tcc-0.9.26

./configure --strip-binaries \
	--enable-cross
make
make install
