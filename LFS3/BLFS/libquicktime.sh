set -eo nounset

cd /sources

for k in \
https://downloads.sourceforge.net/libquicktime/libquicktime-1.2.4.tar.gz \
http://www.linuxfromscratch.org/patches/blfs/svn/libquicktime-1.2.4-ffmpeg3-1.patch ; do
test -f `basename $k` || \
wget --no-check-certificate \
	$k
done

rm -rf libquicktime-1.2.4
tar xf libquicktime-1.2.4.tar.gz
pushd  libquicktime-1.2.4

patch -Np1 -i ../libquicktime-1.2.4-ffmpeg3-1.patch &&

./configure --prefix=/usr     \
            --enable-gpl      \
            --without-doxygen \
            --docdir=/usr/share/doc/libquicktime-1.2.4
make

make install &&

install -v -m755 -d /usr/share/doc/libquicktime-1.2.4 &&
install -v -m644    README doc/{*.txt,*.html,mainpage.incl} \
                    /usr/share/doc/libquicktime-1.2.4

popd
rm -rf libquicktime-1.2.4
