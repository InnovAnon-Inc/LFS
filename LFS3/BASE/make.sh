set -eo nounset

cd /sources

rm -rf make-4.2.1
tar xf make-4.2.1.tar.bz2
pushd  make-4.2.1

./configure --prefix=/usr

make

#make PERL5LIB=$PWD/tests/ check

make install

popd
rm -rf make-4.2.1
