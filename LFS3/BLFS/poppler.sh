set -eo nounset

cd /sources

for k in \
https://poppler.freedesktop.org/poppler-0.60.1.tar.xz \
https://poppler.freedesktop.org/poppler-data-0.4.8.tar.gz ; do
test -f `basename $k` || \
wget --no-check-certificate \
	$k
done

rm -rf poppler-0.60.1
tar xf poppler-0.60.1.tar.xz
pushd  poppler-0.60.1

mkdir build
cd    build

cmake  -DCMAKE_BUILD_TYPE=Release   \
       -DCMAKE_INSTALL_PREFIX=/usr  \
       -DTESTDATADIR=$PWD/testfiles \
       -DENABLE_XPDF_HEADERS=ON     \
       -DENABLE_GTK_DOC=ON          \
       ..
make

make        install
make -C qt5 install

install -m644 poppler-qt5.pc usr/lib/pkgconfig

install -v -m755 -d        /usr/share/doc/poppler-0.60.1
cp -vr glib/reference/html /usr/share/doc/poppler-0.60.1

tar -xf ../poppler-data-0.4.8.tar.gz
cd poppler-data-0.4.8

make prefix=/usr install

popd
rm -rf poppler-0.60.1

