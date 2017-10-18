set -eo nounset

cd /sources

test -f babl-0.1.34.tar.bz2 || \
wget --no-check-certificate \
	https://download.gimp.org/pub/babl/0.1/babl-0.1.34.tar.bz2

rm -rf babl-0.1.34
tar xf babl-0.1.34.tar.bz2
pushd  babl-0.1.34

./configure --prefix=/usr &&
make

make install &&

install -v -m755 -d /usr/share/gtk-doc/html/babl/graphics &&
install -v -m644 docs/*.{css,html} /usr/share/gtk-doc/html/babl &&
install -v -m644 docs/graphics/*.{html,png,svg} /usr/share/gtk-doc/html/babl/graphics

popd
rm -rf babl-0.1.34
