set -eo nounset

cd /sources

rm -rf grub-2.02
tar xf grub-2.02.tar.xz
pushd  grub-2.02

./configure --prefix=/usr          \
            --sbindir=/sbin        \
            --sysconfdir=/etc      \
            --disable-efiemu       \
            --disable-werror

make

make install

popd
rm -rf grub-2.02
