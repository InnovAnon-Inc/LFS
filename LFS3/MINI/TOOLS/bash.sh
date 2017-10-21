set -eo nounset

cd /mnt/lfs/sources

rm -rf bash-4.4
tar xf bash-4.4.tar.gz
pushd  bash-4.4

./configure --prefix=/tools --without-bash-malloc

make

#make tests

make install

ln -sv bash /tools/bin/sh

popd
rm -rf bash-4.4
