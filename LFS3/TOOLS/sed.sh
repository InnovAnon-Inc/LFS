set -eo nounset

cd /sources

rm -rf sed-4.4
tar xf sed-4.4.tar.xz
pushd  sed-4.4

./configure --prefix=/tools

make

#make check

make install

popd
rm -rf sed-4.4
