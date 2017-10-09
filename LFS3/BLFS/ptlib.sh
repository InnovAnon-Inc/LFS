set -eo nounset

cd /sources

for k in \
http://ftp.gnome.org/pub/gnome/sources/ptlib/2.10/ptlib-2.10.11.tar.xz \
http://www.linuxfromscratch.org/patches/blfs/svn/ptlib-2.10.11-bison_fixes-2.patch \
http://www.linuxfromscratch.org/patches/blfs/svn/ptlib-2.10.11-openssl-1.1.0-1.patch ; do
test -f `basename $k` || \
wget --no-check-certificate \
	$k
done

rm -rf ptlib-2.10.11
tar xf ptlib-2.10.11.tar.xz
pushd ptlib-2.10.11

sed -i "s/sbin\.Right(1) == '\\\\0')/strlen(sbin\.Right(1)) == 0)/" \
    src/ptclib/podbc.cxx &&

sed -i '/\/ioctl.h/a#include <sys/uio.h>' src/ptlib/unix/channel.cxx

patch -Np1 -i ../ptlib-2.10.11-openssl-1.1.0-1.patch &&
patch -Np1 -i ../ptlib-2.10.11-bison_fixes-2.patch &&

./configure --prefix=/usr &&
make

make install &&
chmod -v 755 /usr/lib/libpt.so.2.10.11

popd
rm -rf ptlib-2.10.11
