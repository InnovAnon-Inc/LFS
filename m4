#! /bin/sh
set -exo nounset

cd $LFS/sources

rm -rf m4-1.14.18
tar xf m4-1.4.18.tar.xz
cd m4-1.4.18

./configure --prefix=/tools

make

make check

make install