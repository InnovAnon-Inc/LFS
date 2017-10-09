set -eo nounset

cd /mnt/lfs/sources

rm -rf tar-1.29
tar xf tar-1.29.tar.xz
pushd tar-1.29

./configure --prefix=/tools

make

#make check

make install

popd
rm -rf tar-1.29
