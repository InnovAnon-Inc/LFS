set -eo nounset

cd /sources

test -f ffmpeg-3.3.4.tar.xz || \
wget --no-check-certificate \
	http://ffmpeg.org/releases/ffmpeg-3.3.4.tar.xz
rm -rf ffmpeg-3.3.4
tar xf ffmpeg-3.3.4.tar.xz
pushd  ffmpeg-3.3.4

sed -i 's/-lflite"/-lflite -lasound"/' configure &&

./configure --prefix=/usr        \
            --enable-gpl         \
            --enable-version3    \
            --enable-nonfree     \
            --disable-static     \
            --enable-shared      \
            --disable-debug      \
            --enable-libass      \
            --enable-libfdk-aac  \
            --enable-libfreetype \
            --enable-libmp3lame  \
            --enable-libopus     \
            --enable-libtheora   \
            --enable-libvorbis   \
            --enable-libvpx      \
            --enable-libx264     \
            --enable-libx265     \
            --docdir=/usr/share/doc/ffmpeg-3.3.4 &&

make &&

gcc tools/qt-faststart.c -o tools/qt-faststart

pushd doc &&
for DOCNAME in `basename -s .html *.html`
do
    texi2pdf -b $DOCNAME.texi &&
    texi2dvi -b $DOCNAME.texi &&

    dvips    -o $DOCNAME.ps   \
                $DOCNAME.dvi
done &&
popd &&
unset DOCNAME

make install &&

install -v -m755    tools/qt-faststart /usr/bin &&
install -v -m755 -d           /usr/share/doc/ffmpeg-3.3.4 &&
install -v -m644    doc/*.txt /usr/share/doc/ffmpeg-3.3.4

install -v -m644 doc/*.pdf /usr/share/doc/ffmpeg-3.3.4 &&
install -v -m644 doc/*.ps  /usr/share/doc/ffmpeg-3.3.4

install -v -m755 -d /usr/share/doc/ffmpeg-3.3.4/api                     &&
cp -vr doc/doxy/html/* /usr/share/doc/ffmpeg-3.3.4/api                  &&
find /usr/share/doc/ffmpeg-3.3.4/api -type f -exec chmod -c 0644 \{} \; &&
find /usr/share/doc/ffmpeg-3.3.4/api -type d -exec chmod -c 0755 \{} \;

#make fate-rsync SAMPLES=fate-suite/

#rsync -vrltLW  --delete --timeout=60 --contimeout=60 \
#      rsync://fate-suite.ffmpeg.org/fate-suite/ fate-suite/

#make fate THREADS=N SAMPLES=fate-suite/ | tee ../fate.log &&
#grep ^TEST ../fate.log | wc -l

popd
rm -rf ffmpeg-3.3.4
