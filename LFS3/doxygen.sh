cd /sources

test -f doxygen-1.8.13.src.tar.gz || \
wget --no-check-certificate \
	http://ftp.stack.nl/pub/doxygen/doxygen-1.8.13.src.tar.gz

rm -rf doxygen-1.8.13
tar xf doxygen-1.8.13.src.tar.gz
cd doxygen-1.8.13

mkdir -v build
cd       build

cmake -G "Unix Makefiles"         \
      -DCMAKE_BUILD_TYPE=Release  \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -Wno-dev ..

make

cmake -DDOC_INSTALL_DIR=share/doc/doxygen-1.8.13 -Dbuild_doc=ON ..

make docs

make install
install -vm644 ../doc/*.1 /usr/share/man/man1
