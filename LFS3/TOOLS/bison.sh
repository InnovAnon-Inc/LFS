set -eo nounset

cd /sources

rm -rf bison-3.0.4
tar xf bison-3.0.4.tar.xz
pushd  bison-3.0.4

./configure --prefix=/tools

make

#make check

make install

popd
rm -rf bison-3.0.4
