set -eo nounset

cd /sources

for k in \
https://xcb.freedesktop.org/dist/libxcb-1.12.tar.bz2 \
http://www.linuxfromscratch.org/patches/blfs/svn/libxcb-1.12-python3-1.patch ; do
test -f `basename $k` || \
wget --no-check-certificate \
	$k
done

rm -rf libxcb-1.12
tar xf libxcb-1.12.tar.bz2
pushd  libxcb-1.12

patch -Np1 -i ../libxcb-1.12-python3-1.patch

sed -i "s/pthread-stubs//" configure

./configure $XORG_CONFIG      \
            --enable-xinput   \
            --without-doxygen \
            --docdir='${datadir}'/doc/libxcb-1.12
make

make install

popd
rm -rf libxcb-1.12
