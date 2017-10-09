set -eo nounset

cd /mnt/lfs/sources

rm -rf dejagnu-1.6
tar xf dejagnu-1.6.tar.gz
pushd  dejagnu-1.6

./configure --prefix=/tools

make install

#make check

popd
rm -rf dejagnu-1.6
