set -eo nounset

cd /sources

for k in \
http://ftp.gnome.org/pub/gnome/sources/pygobject/2.28/pygobject-2.28.6.tar.xz \
http://www.linuxfromscratch.org/patches/blfs/svn/pygobject-2.28.6-fixes-1.patch ; do
test -f `basename $k` || \
wget --no-check-certificate \
	$k
done

rm -rf pygobject-2.28.6
tar xf pygobject-2.28.6.tar.xz
pushd  pygobject-2.28.6

patch -Np1 -i ../pygobject-2.28.6-fixes-1.patch   &&
./configure --prefix=/usr --disable-introspection &&
make

make install

popd
rm -rf pygobject-2.28.6

