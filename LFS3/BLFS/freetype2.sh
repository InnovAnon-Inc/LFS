set -eo nounset

cd /sources

for k in \
https://downloads.sourceforge.net/freetype/freetype-2.8.1.tar.bz2 \
https://downloads.sourceforge.net/freetype/freetype-doc-2.8.1.tar.bz2 ; do
test -f `basename $k` || \
wget --no-check-certificate \
	$k
done

rm -rf freetype-2.8.1
tar xf freetype-2.8.1.tar.bz2
pushd  freetype-2.8.1

tar -xf ../freetype-doc-2.8.1.tar.bz2 --strip-components=2 -C docs

sed -ri "s:.*(AUX_MODULES.*valid):\1:" modules.cfg

sed -r "s:.*(#.*SUBPIXEL_RENDERING) .*:\1:" \
    -i include/freetype/config/ftoption.h

if test -d /usr/include/harfbuzz ; then
	ABC=--with-harfbuzz=yes
else
	ABC=--with-harfbuzz=no
fi
./configure --prefix=/usr --disable-static $ABC
make

make install
install -v -m755 -d /usr/share/doc/freetype-2.8.1
cp -v -R docs/*     /usr/share/doc/freetype-2.8.1

popd
rm -rf freetype-2.8.1
