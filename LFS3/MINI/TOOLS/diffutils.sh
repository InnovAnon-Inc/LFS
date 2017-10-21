set -eo nounset

cd /mnt/lfs/sources

rm -rf diffutils-3.6
tar xf diffutils-3.6.tar.xz
pushd  diffutils-3.6

./configure --prefix=/tools

make

#make check

make install

popd
rm -rf diffutils-3.6
