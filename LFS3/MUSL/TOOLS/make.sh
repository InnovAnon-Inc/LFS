set -eo nounset

cd /mnt/lfs/sources

rm -rf make-4.2.1
tar xf make-4.2.1.tar.bz2
pushd  make-4.2.1

./configure --prefix=/tools --without-guile

make

#make check

make install

popd
rm -rf make-4.2.1
