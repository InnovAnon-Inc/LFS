set -eo nounset

cd /sources

rm -rf patch-2.7.5
tar xf patch-2.7.5.tar.xz
pushd  patch-2.7.5

./configure --prefix=/usr

make

#make check

make install

popd
rm -rf patch-2.7.5
