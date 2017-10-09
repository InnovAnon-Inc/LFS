set -eo nounset

cd /sources

rm -rf expect5.45
tar xf expect5.45.tar.gz
pushd  expect5.45

cp -v configure{,.orig}
sed 's:/usr/local/bin:/bin:' configure.orig > configure

./configure --prefix=/tools       \
            --with-tcl=/tools/lib \
            --with-tclinclude=/tools/include

make

#make test

make SCRIPTS="" install

popd
rm -rf expect5.45
