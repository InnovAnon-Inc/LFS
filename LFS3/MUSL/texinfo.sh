set -eo nounset

cd /mnt/lfs/sources

rm -rf texinfo-6.5
tar xf texinfo-6.5.tar.xz
pushd  texinfo-6.5

./configure --prefix=/tools

make

#make check

make install

popd
rm -rf texinfo-6.5
