set -eo nounset

cd /sources

rm -rf findutils-4.6.0
tar xf findutils-4.6.0.tar.gz
pushd  findutils-4.6.0

./configure --prefix=/tools

make

#make check

make install

popd
rm -rf findutils-4.6.0
