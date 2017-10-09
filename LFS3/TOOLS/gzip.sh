set -eo nounset

cd /sources

rm -rf gzip-1.8
tar xf gzip-1.8.tar.gz
pushd  gzip-1.8

./configure --prefix=/tools

make

#make check

make install

popd
rm -rf gzip-1.8
