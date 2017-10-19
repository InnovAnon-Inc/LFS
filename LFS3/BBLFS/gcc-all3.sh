set -eo nounset

cd /sources

for k in \
https://ftp.gnu.org/gnu/gcc/gcc-7.2.0/gcc-7.2.0.tar.xz \
http://mirrors.cdn.adacore.com/art/591c6d80c7a447af2deed1d7 ; do
test -f `basename $k` || \
wget --no-check-certificate \
	$k
done

rm -rf gcc-7.2.0
tar xf gcc-7.2.0.tar.xz
pushd  gcc-7.2.0

mkdir build
cd    build

../configure               \
    --prefix=/usr          \
    --disable-multilib     \
    --with-system-zlib     \
    --enable-languages=ada,brig,c,c++,fortran,go,jit,lto,objc,obj-c++ \
    --enable-install-libiberty \
    --enable-host-shared
make

make install
mkdir -pv /usr/share/gdb/auto-load/usr/lib
mv -v /usr/lib/*gdb.py /usr/share/gdb/auto-load/usr/lib

chown -v -R root:root \
    /usr/lib/gcc/*linux-gnu/7.2.0/include{,-fixed} \
    /usr/lib/gcc/*linux-gnu/7.2.0/ada{lib,include}
chown -v -R root:root \
    /usr/lib/gcc/*linux-gnu/7.2.0/include{,-fixed}

ln -v -sf ../usr/bin/cpp /lib
ln -v -sf gcc /usr/bin/cc
install -v -dm755 /usr/lib/bfd-plugins
ln -sfv ../../libexec/gcc/$(gcc -dumpmachine)/7.2.0/liblto_plugin.so /usr/lib/bfd-plugins/

popd
rm -rf gcc-7.2.0

