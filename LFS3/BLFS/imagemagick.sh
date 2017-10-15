set -eo nounset

cd /sources

test -f ImageMagick-7.0.6-10.tar.xz || \
wget --no-check-certificate \
	https://www.imagemagick.org/download/releases/ImageMagick-7.0.6-10.tar.xz

rm -rf ImageMagick-7.0.6-10
tar xf ImageMagick-7.0.6-10.tar.xz
pushd  ImageMagick-7.0.6-10

./configure --prefix=/usr     \
            --sysconfdir=/etc \
            --enable-hdri     \
            --with-modules    \
            --with-perl       \
            --disable-static  &&
make

make DOCUMENTATION_PATH=/usr/share/doc/imagemagick-7.0.6 install

popd
rm -rf ImageMagick-7.0.6-10
