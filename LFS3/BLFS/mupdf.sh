set -eo nounset

cd /sources

for k in \
http://www.mupdf.com/downloads/archive/mupdf-1.11-source.tar.gz \
http://www.linuxfromscratch.org/patches/blfs/svn/mupdf-1.11-shared_libs-1.patch \
http://www.linuxfromscratch.org/patches/blfs/svn/mupdf-1.11-openjpeg-3.patch ; do
test -f `basename $k` || \
wget --no-check-certificate \
	$k
done

rm -rf mupdf-1.11-source
tar xf mupdf-1.11-source.tar.gz
pushd  mupdf-1.11-source

rm -rf thirdparty/curl     &&
rm -rf thirdparty/freetype &&
rm -rf thirdparty/harfbuzz &&
rm -rf thirdparty/jpeg     &&
rm -rf thirdparty/libjpeg  &&
rm -rf thirdparty/openjpeg &&
rm -rf thirdparty/zlib     &&

patch -Np1 -i ../mupdf-1.11-openjpeg-2.patch    &&
patch -Np1 -i ../mupdf-1.11-shared_libs-1.patch &&

make build=release

make prefix=/usr                      \
     build=release                    \
     docdir=/usr/share/doc/mupdf-1.11 \
     install                          &&

ln -sfv mupdf-x11-curl /usr/bin/mupdf

popd
rm -rf mupdf-1.11-source
