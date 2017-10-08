cd /sources

test -f gdb-8.0.1.tar.xz || \
wget --no-check-certificate \
	https://ftp.gnu.org/gnu/gdb/gdb-8.0.1.tar.xz

rm -rf gdb-8.0.1
tar xf gdb-8.0.1.tar.xz
cd gdb-8.0.1

./configure --prefix=/usr --with-system-readline --without-guile
make

make -C gdb/doc doxy

#pushd gdb/testsuite
#make  site.exp
#echo  "set gdb_test_timeout 120" >> site.exp
#runtest TRANSCRIPT=y
#popd

make -C gdb install

install -d /usr/share/doc/gdb-8.0.1
rm -rf gdb/doc/doxy/xml
cp -Rv gdb/doc/doxy /usr/share/doc/gdb-8.0.1
