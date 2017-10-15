set -eo nounset

cd /sources

for k in \
ftp://tug.org/texlive/historic/2017/texlive-20170524-source.tar.xz \
ftp://tug.org/texlive/historic/2017/texlive-20170524-texmf.tar.xz \
http://www.linuxfromscratch.org/patches/blfs/svn/texlive-20170524-source-gcc7-1.patch \
http://www.linuxfromscratch.org/patches/blfs/svn/texlive-20170524-source-upstream_fixes-2.patch \
http://www.linuxfromscratch.org/patches/blfs/svn/texlive-20170524-source-poppler059-1.patch \
http://www.linuxfromscratch.org/patches/blfs/svn/texlive-20170524-texmf-upstream_fixes-1.patch ; do
test -f `basename $k` || \
wget --no-check-certificate \
	$k
done

rm -rf texlive-20170524-source
tar xf texlive-20170524-source.tar.xz
pushd texlive-20170524-source

grep -q /opt/texlive/2017/lib /etc/ld.so.conf || \
cat >> /etc/ld.so.conf << EOF
# Begin texlive 2017 addition

/opt/texlive/2017/lib

# End texlive 2017 addition
EOF

export TEXARCH=$(uname -m | sed -e 's/i.86/i386/' -e 's/$/-linux/')

patch -Np1 -i ../texlive-20170524-source-gcc7-1.patch
patch -Np1 -i ../texlive-20170524-source-upstream_fixes-2.patch
patch -Np1 -i ../texlive-20170524-source-poppler059-1.patch

mkdir texlive-build
cd texlive-build

../configure                                                    \
    --prefix=/opt/texlive/2017                                  \
    --bindir=/opt/texlive/2017/bin/$TEXARCH                     \
    --datarootdir=/opt/texlive/2017                             \
    --includedir=/opt/texlive/2017/include                      \
    --infodir=/opt/texlive/2017/texmf-dist/doc/info             \
    --libdir=/opt/texlive/2017/lib                              \
    --mandir=/opt/texlive/2017/texmf-dist/doc/man               \
    --disable-native-texlive-build                              \
    --disable-static --enable-shared                            \
    --with-system-cairo                                         \
    --with-system-fontconfig                                    \
    --with-system-freetype2                                     \
    --with-system-gmp                                           \
    --with-system-graphite2                                     \
    --with-system-harfbuzz                                      \
    --with-system-icu                                           \
    --with-system-libgs                                         \
    --with-system-libpaper                                      \
    --with-system-libpng                                        \
    --with-system-mpfr                                          \
    --with-system-pixman                                        \
    --with-system-poppler                                       \
    --with-system-xpdf                                          \
    --with-system-zlib                                          \
    --with-banner-add=" - BLFS"

make

make install-strip
/sbin/ldconfig
make texlinks
mkdir -pv /opt/texlive/2017/tlpkg/TeXLive/
install -v -m644 ../texk/tests/TeXLive/* /opt/texlive/2017/tlpkg/TeXLive/

tar -xf ../../texlive-20170524-texmf.tar.xz -C /opt/texlive/2017 --strip-components=1
pushd /opt/texlive/2017
patch -Np1 -i /sources/texlive-20170524-texmf-upstream_fixes-1.patch
popd

mktexlsr
fmtutil-sys --all
mtxrun --generate

popd
rm -rf texlive-20170524-source
