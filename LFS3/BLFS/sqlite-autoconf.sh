set -eo nounset

cd /sources

test -f sqlite-autoconf-3200100.tar.gz || \
wget --no-check-certificate \
	https://sqlite.org/2017/sqlite-autoconf-3200100.tar.gz

test -f sqlite-doc-3200100.zip || \
wget --no-check-certificate \
	https://sqlite.org/2017/sqlite-doc-3200100.zip

rm -rf sqlite-autoconf-3200100
tar xf sqlite-autoconf-3200100.tar.gz
pushd sqlite-autoconf-3200100

#unzip -q ../sqlite-doc-3200100.zip

./configure --prefix=/usr --disable-static        \
            CFLAGS="-g -O2 -DSQLITE_ENABLE_FTS3=1 \
            -DSQLITE_ENABLE_COLUMN_METADATA=1     \
            -DSQLITE_ENABLE_UNLOCK_NOTIFY=1       \
            -DSQLITE_SECURE_DELETE=1              \
            -DSQLITE_ENABLE_DBSTAT_VTAB=1"
make

make install

popd
rm -rf sqlite-autoconf-3200100
