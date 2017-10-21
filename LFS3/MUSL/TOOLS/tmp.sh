set -eo nounset

cd /mnt/lfs/sources

mkdir tmp
pushd tmp

rm -rf gcc-7.2.0
tar xf gcc-7.2.0.tar.xz
pushd  gcc-7.2.0

mkdir -v build
cd       build

CC=/usr/local/musl/bin/musl-gcc \
../libstdc++-v3/configure           \
    --prefix=/usr/local/musl        \
    --disable-multilib              \
    --disable-nls                   \
    --disable-libstdcxx-threads     \
    --disable-libstdcxx-pch         \
    --with-gxx-include-dir=/tools/$LFS_TGT/include/c++/7.2.0

make

make install

popd
rm -rf gcc-7.2.0
popd
rm -rf tmp
