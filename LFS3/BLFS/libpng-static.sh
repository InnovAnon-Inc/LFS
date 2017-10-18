set -eo nounset

cd /sources

for k in \
http://downloads.sourceforge.net/libpng/libpng-1.6.32.tar.xz \
http://downloads.sourceforge.net/sourceforge/libpng-apng/libpng-1.6.32-apng.patch.gz ; do
test -f `basename $k` || \
wget --no-check-certificate \
	$k
done

rm -rf libpng-1.6.32
tar xf libpng-1.6.32.tar.xz
pushd  libpng-1.6.32

gzip -cd ../libpng-1.6.32-apng.patch.gz | patch -p1

./configure --prefix=/usr --enable-static
make

make install
mkdir -v /usr/share/doc/libpng-1.6.32
cp -v README libpng-manual.txt /usr/share/doc/libpng-1.6.32

popd
rm -rf libpng-1.6.32
