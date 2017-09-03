#! /bin/sh
set -exo nounset

cd $LFS/sources

rm -rf bash-4.4
tar xf bash-4.4.tar.gz
cd bash-4.4

./configure --prefix=/tools --without-bash-malloc

make

make tests

make install

ln -sv bash /tools/bin/sh