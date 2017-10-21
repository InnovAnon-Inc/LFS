set -eo nounset

cd /mnt/lfs/sources

rm -rf m4-1.4.18
tar xf m4-1.4.18.tar.xz
pushd  m4-1.4.18

./configure --prefix=/tools

make

#make check

make install

popd
rm -rf m4-1.4.18
