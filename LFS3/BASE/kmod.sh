set -eo nounset

cd /sources

rm -rf kmod-24
tar xf kmod-24.tar.xz
pushd  kmod-24

./configure --prefix=/usr          \
            --bindir=/bin          \
            --sysconfdir=/etc      \
            --with-rootlibdir=/lib \
            --with-xz              \
            --with-zlib

make

make install

for target in depmod insmod lsmod modinfo modprobe rmmod; do
  ln -sfv ../bin/kmod /sbin/$target
done

ln -sfv kmod /bin/lsmod

popd
rm -rf kmod-24
