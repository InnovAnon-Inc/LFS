set -eo nounset

cd /mnt/lfs/sources

rm -rf util-linux-2.30.2
tar xf util-linux-2.30.2.tar.xz
pushd  util-linux-2.30.2

./configure --prefix=/tools                \
            --without-python               \
            --disable-makeinstall-chown    \
            --without-systemdsystemunitdir \
            --without-ncurses              \
            PKG_CONFIG=""

make

make install

popd
rm -rf util-linux-2.30.2
