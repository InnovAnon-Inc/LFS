set -eo nounset

cd /mnt/lfs/sources

rm -rf xz-5.2.3
tar xf xz-5.2.3.tar.xz
pushd  xz-5.2.3

./configure --prefix=/tools

make

#make check

make install

popd
rm -rf xz-5.2.3
