set -eo nounset

cd /mnt/lfs/sources

rm -rf glibc-2.26
tar xf glibc-2.26.tar.xz
pushd  glibc-2.26

mkdir -v build
cd       build

../configure                             \
      --prefix=/tools                    \
      --host=$LFS_TGT                    \
      --build=$(../scripts/config.guess) \
      --enable-kernel=3.2             \
      --with-headers=/tools/include      \
      libc_cv_forced_unwind=yes          \
      libc_cv_c_cleanup=yes

make -j1

make install

echo 'int main(){}' > dummy.c
$LFS_TGT-gcc dummy.c
readelf -l a.out | grep ': /tools' | \
grep -q '[Requesting program interpreter: /tools/lib/ld-linux.so.2]'

rm -rf dummy.c a.out

popd
rm -rf glibc-2.26
