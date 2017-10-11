set -eo nounset

cd /sources

for k in \
https://xcb.freedesktop.org/dist/xcb-proto-1.12.tar.bz2 \
http://www.linuxfromscratch.org/patches/blfs/svn/xcb-proto-1.12-python3-1.patch \
http://www.linuxfromscratch.org/patches/blfs/svn/xcb-proto-1.12-schema-1.patch ; do
test -f `basename $k` || \
wget --no-check-certificate \
	$k
done

rm -rf xcb-proto-1.12
tar xf xcb-proto-1.12.tar.bz2
pushd  xcb-proto-1.12

patch -Np1 -i ../xcb-proto-1.12-schema-1.patch

patch -Np1 -i ../xcb-proto-1.12-python3-1.patch

./configure $XORG_CONFIG

make install

popd
rm -rf xcb-proto-1.12
