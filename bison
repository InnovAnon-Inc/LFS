#! /bin/sh
set -exo nounset

cd $LFS/sources

rm -rf bison-3.0.4
tar xf bison-3.0.4.tar.xz
cd bison-3.0.4

./configure --prefix=/tools

make

make check

make install