set -eo nounset

cd /sources

test -f gegl-0.3.20.tar.bz2 || \
wget --no-check-certificate \
	https://download.gimp.org/pub/gegl/0.3/gegl-0.3.20.tar.bz2

rm -rf gegl-0.3.20
tar xf gegl-0.3.20.tar.bz2
pushd  gegl-0.3.20

./configure --prefix=/usr &&
LC_ALL=en_US make

make install &&
install -v -m644 docs/*.{css,html} /usr/share/gtk-doc/html/gegl &&
install -d -v -m755 /usr/share/gtk-doc/html/gegl/images &&
install -v -m644 docs/images/*.{png,ico,svg} /usr/share/gtk-doc/html/gegl/images

popd
rm -rf gegl-0.3.20
