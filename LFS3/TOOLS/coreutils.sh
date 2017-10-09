set -eo nounset

cd /sources

rm -rf coreutils-8.28
tar xf coreutils-8.28.tar.xz
pushd coreutils-8.28

./configure --prefix=/tools --enable-install-program=hostname

make

#make RUN_EXPENSIVE_TESTS=yes check

make install

popd
rm -rf coreutils-8.28
