set -eo nounset

cd /sources

for k in \
http://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs922/ghostscript-9.22.tar.gz \
http://downloads.sourceforge.net/gs-fonts/ghostscript-fonts-std-8.11.tar.gz \
http://downloads.sourceforge.net/gs-fonts/gnu-gs-fonts-other-6.0.tar.gz ; do
test -f `basename $k` || \
wget --no-check-certificate \
	$k
done

rm -rf ghostscript-9.22
tar xf ghostscript-9.22.tar.gz
pushd  ghostscript-9.22

rm -rf freetype lcms2 jpeg libpng

rm -rf zlib

./configure --prefix=/usr           \
            --disable-compile-inits \
            --enable-dynamic        \
            --with-system-libtiff
make

make so

make install

make soinstall
install -v -m644 base/*.h /usr/include/ghostscript
ln -v -s ghostscript /usr/include/ps

ln -sfvn ../ghostscript/9.22/doc /usr/share/doc/ghostscript-9.22

for k in \
ghostscript-fonts-std-8.11.tar.gz \
gnu-gs-fonts-other-6.0.tar.gz ; do
tar -xvf ../$k -C /usr/share/ghostscript --no-same-owner
fc-cache -v /usr/share/ghostscript/fonts/
done

#gs -q -dBATCH /usr/share/ghostscript/9.22/examples/tiger.eps

popd
rm -rf ghostscript-9.22

