set -eo nounset
set +h

cd /sources

rm -rf binutils-2.29
tar xf binutils-2.29.tar.bz2
pushd  binutils-2.29

expect -c "spawn ls" | \
grep -q 'spawn ls'

mkdir -v build
cd       build

../configure --prefix=/usr       \
             --enable-gold       \
             --enable-ld=default \
             --enable-plugins    \
             --enable-shared     \
             --disable-werror    \
             --with-system-zlib

make tooldir=/usr

# TODO do not skip
#make -k check

make tooldir=/usr install

popd
rm -rf binutils-2.29