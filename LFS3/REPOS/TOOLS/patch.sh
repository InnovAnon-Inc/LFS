set -eo nounset

cd /mnt/lfs/sources

rm -rf patch-2.7.5
tar xf patch-2.7.5.tar.xz
pushd  patch-2.7.5

./configure --prefix=/tools

make

#make check

make install

popd
rm -rf patch-2.7.5
