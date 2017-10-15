set -eo nounset

cd /sources

for k in \
https://openssl.org/source/openssl-1.0.2l.tar.gz \
http://www.linuxfromscratch.org/patches/blfs/svn/openssl-1.0.2l-compat_versioned_symbols-1.patch ; do
test -f `basename $k` || \
wget --no-check-certificate \
	$k
done

rm -rf openssl-1.0.2l
tar xf openssl-1.0.2l.tar.gz
pushd  openssl-1.0.2l

patch -Np1 -i ../openssl-1.0.2l-compat_versioned_symbols-1.patch

./config --prefix=/usr            \
         --openssldir=/etc/ssl    \
         --libdir=lib/openssl-1.0 \
         shared                   \
         zlib-dynamic

make depend
make -j1

make INSTALL_PREFIX=$PWD/Dest install_sw

install -vdm755                   /usr/lib/openssl-1.0
cp -Rv Dest/usr/lib/openssl-1.0/* /usr/lib/openssl-1.0

mv -v  /usr/lib/openssl-1.0/lib{crypto,ssl}.so.1.0.0 /usr/lib
ln -sv ../libssl.so.1.0.0         /usr/lib/openssl-1.0
ln -sv ../libcrypto.so.1.0.0      /usr/lib/openssl-1.0

install -vdm755                   /usr/include/openssl-1.0
cp -Rv Dest/usr/include/openssl   /usr/include/openssl-1.0

sed 's@/include$@/include/openssl-1.0@' -i /usr/lib/openssl-1.0/pkgconfig/*.pc

popd
rm -rf openssl-1.0.2l

