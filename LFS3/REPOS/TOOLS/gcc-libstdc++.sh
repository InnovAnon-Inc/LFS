set -eo nounset

cd /other-repos || cd /repos

cd gcc
git reset --hard
git clean -d -f -x
#git pull origin master

autoreconf -fi

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
