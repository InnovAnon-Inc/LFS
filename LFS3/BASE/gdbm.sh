set -eo nounset

cd /sources

rm -rf gdbm-1.13
tar xf gdbm-1.13.tar.gz
pushd  gdbm-1.13

./configure --prefix=/usr \
            --disable-static \
            --enable-libgdbm-compat

make

#make check

make install

popd
rm -rf gdbm-1.13
