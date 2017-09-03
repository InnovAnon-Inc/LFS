#! /bin/sh
set -exo nounset

cd $LFS/sources

rm -rf gawk-4.1.4
tar xf gawk-4.1.4.tar.xz
cd gawk-4.1.4

./configure --prefix=/tools

make

make check

make install