set -eo nounset

cd /mnt/lfs/sources

rm -rf gcc-7.2.0
tar xf gcc-7.2.0.tar.xz
pushd  gcc-7.2.0

mkdir -v build
cd       build

../libstdc++-v3/configure           \
    --host=$LFS_TGT                 \
    --prefix=/tools                 \
    --disable-multilib              \
    --disable-nls                   \
    --disable-libstdcxx-threads     \
    --disable-libstdcxx-pch         \
    --with-gxx-include-dir=/tools/$LFS_TGT/include/c++/7.2.0

make

make install

popd
rm -rf gcc-7.2.0
