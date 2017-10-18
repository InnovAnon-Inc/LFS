set -eo nounset

cd /sources

test -f pciutils-3.5.5.tar.xz || \
wget --no-check-certificate \
	https://www.kernel.org/pub/software/utils/pciutils/pciutils-3.5.5.tar.xz

rm -rf pciutils-3.5.5
tar xf pciutils-3.5.5.tar.xz
pushd  pciutils-3.5.5

make PREFIX=/usr                \
     SHAREDIR=/usr/share/hwdata \
     SHARED=no                  \
     STATIC=yes

make PREFIX=/usr                \
     SHAREDIR=/usr/share/hwdata \
     SHARED=no                  \
     STATIC=yes                 \
     install install-lib        &&

chmod -v 755 /usr/lib/libpci.a

popd
rm -rf pciutils-3.5.5
