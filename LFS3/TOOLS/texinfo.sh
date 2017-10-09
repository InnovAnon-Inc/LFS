set -eo nounset

cd /mnt/lfs/sources

rm -rf texinfo-6.4
tar xf texinfo-6.4.tar.xz
pushd  texinfo-6.4

./configure --prefix=/tools

make

#make check

make install

popd
rm -rf texinfo-6.4
