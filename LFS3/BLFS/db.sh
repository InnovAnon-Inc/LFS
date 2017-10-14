set -eo nounset

cd /sources

test -f db-6.2.32.tar.gz || \
wget --no-check-certificate \
	http://download.oracle.com/berkeley-db/db-6.2.32.tar.gz

rm -rf db-6.2.32
tar xf db-6.2.32.tar.gz
pushd  db-6.2.32

cd build_unix
../dist/configure --prefix=/usr      \
                  --enable-compat185 \
                  --enable-dbm       \
                  --disable-static   \
                  --enable-cxx
make

make docdir=/usr/share/doc/db-6.2.32 install

chown -v -R root:root                        \
      /usr/bin/db_*                          \
      /usr/include/db{,_185,_cxx}.h          \
      /usr/lib/libdb*.{so,la}                \
      /usr/share/doc/db-6.2.32

popd
rm -rf db-6.2.32

