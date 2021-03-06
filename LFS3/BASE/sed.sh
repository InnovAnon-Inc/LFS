set -eo nounset
set +h

cd /sources

rm -rf sed-4.4
tar xf sed-4.4.tar.xz
pushd  sed-4.4

sed -i 's/usr/tools/'                 build-aux/help2man
sed -i 's/testsuite.panic-tests.sh//' Makefile.in

./configure --prefix=/usr --bindir=/bin

make
make html

#make check

make install
install -d -m755           /usr/share/doc/sed-4.4
install -m644 doc/sed.html /usr/share/doc/sed-4.4

popd
rm -rf sed-4.4
