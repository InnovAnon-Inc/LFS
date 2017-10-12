set -eo nounset

cd /sources

test -f gc-7.6.0.tar.gz || \
wget --no-check-certificate \
	http://www.hboehm.info/gc/gc_source/gc-7.6.0.tar.gz

rm -rf gc-7.6.0
tar xf gc-7.6.0.tar.gz
pushd  gc-7.6.0

sed -i 's#pkgdata#doc#' doc/doc.am
autoreconf -fi
./configure --prefix=/usr      \
            --enable-cplusplus \
            --disable-static   \
            --docdir=/usr/share/doc/gc-7.6.0
make

make install
install -v -m644 doc/gc.man /usr/share/man/man3/gc_malloc.3
ln -sfv gc_malloc.3 /usr/share/man/man3/gc.3

popd
rm -rf gc-7.6.0
