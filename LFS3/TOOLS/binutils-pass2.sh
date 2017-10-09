set -eo nounset

cd /mnt/lfs/sources

rm -rf binutils-2.29
tar xf binutils-2.29.tar.bz2
pushd  binutils-2.29

mkdir -v build
cd       build

CC=$LFS_TGT-gcc                \
AR=$LFS_TGT-ar                 \
RANLIB=$LFS_TGT-ranlib         \
../configure                   \
    --prefix=/tools            \
    --disable-nls              \
    --disable-werror           \
    --with-lib-path=/tools/lib \
    --with-sysroot

make

make install

make -C ld clean
make -C ld LIB_PATH=/usr/lib:/lib
cp -v ld/ld-new /tools/bin

popd
rm -rf binutils-2.29
