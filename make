#! /bin/sh
set -exo nounset

cd $LFS/sources

rm -rf make-4.2.1
tar xf make-4.2.1.tar.bz2
cd make-4.2.1

./configure --prefix=/tools --without-guile

make

make check

make install