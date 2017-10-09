set -eo nounset

cd /mnt/lfs/sources

rm -rf gawk-4.1.4
tar xf gawk-4.1.4.tar.xz
pushd  gawk-4.1.4

./configure --prefix=/tools

make

#make check

make install

popd
rm -rf gawk-4.1.4
