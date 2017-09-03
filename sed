#! /bin/sh
set -exo nounset

cd $LFS/sources

rm -rf sed-4.4
tar xf sed-4.4.tar.xz
cd sed-4.4

./configure --prefix=/tools

make

make check

make install