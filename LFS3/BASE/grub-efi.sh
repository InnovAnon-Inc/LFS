set -eo nounset
set +h

cd /sources

rm -rf grub-2.02
tar xf grub-2.02.tar.xz
pushd  grub-2.02

./configure --prefix=/usr          \
            --sbindir=/sbin        \
            --sysconfdir=/etc      \
            --disable-efiemu       \
            --enable-grub-mkfont   \
            --with-platform=efi    \
            --target=x86_64        \
            --program-prefix=""    \
            --with-bootdir=/boot   \
            --with-grubdir=grub    \
            --disable-werror

make

make install

grub-mkfont -o /usr/share/grub/unicode.pf2 > \
         /usr/share/fonts/unifont/unifont.pcf

popd
rm -rf grub-2.02
