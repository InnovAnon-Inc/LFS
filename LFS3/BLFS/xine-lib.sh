set -eo nounset

cd /sources

test -f xine-lib-1.2.8.tar.xz || \
wget --no-check-certificate \
	https://downloads.sourceforge.net/xine/xine-lib-1.2.8.tar.xz
rm -rf xine-lib-1.2.8
tar xf xine-lib-1.2.8.tar.xz
pushd  xine-lib-1.2.8

sed -e 's|wand/magick_wand.h|MagickWand/MagickWand.h|' \
    -i src/video_dec/image.c &&

sed -e 's/\(xcb-shape >= 1.0\)/xcb \1/' \
    -i m4/video_out.m4 &&

./configure --prefix=/usr          \
            --disable-vcd          \
            --with-external-dvdnav \
            --docdir=/usr/share/doc/xine-lib-1.2.8 &&
make

doxygen doc/Doxyfile

make install

install -v -m755 -d /usr/share/doc/xine-lib-1.2.8/api &&
install -v -m644    doc/api/* \
                    /usr/share/doc/xine-lib-1.2.8/api

popd
rm -rf xine-lib-1.2.8
