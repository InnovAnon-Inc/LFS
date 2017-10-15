set -eo nounset

cd /sources

for k in \
https://archive.apache.org/dist/xmlgraphics/fop/source/fop-2.2-src.tar.gz \
http://downloads.sourceforge.net/offo/2.2/offo-hyphenation.zip \
http://download.java.net/media/jai/builds/release/1_1_3/jai-1_1_3-lib-linux-amd64.tar.gz \
http://download.java.net/media/jai/builds/release/1_1_3/jai-1_1_3-lib-linux-amd64.tar.gz ; do
test -f `basename $k` || \
wget --no-check-certificate \
	$k
done

rm -rf fop-2.2
tar xf fop-2.2-src.tar.gz
pushd  fop-2.2

unzip ../offo-hyphenation.zip &&
cp offo-hyphenation/hyph/* fop/hyph &&
rm -rf offo-hyphenation

case `uname -m` in
  i?86)
    tar -xf ../jai-1_1_3-lib-linux-amd64.tar.gz
    cp -v jai-1_1_3/lib/{jai*,mlibwrapper_jai.jar} $JAVA_HOME/jre/lib/ext/
    cp -v jai-1_1_3/lib/libmlib_jai.so             $JAVA_HOME/jre/lib/i386/
    ;;

  x86_64)
    tar -xf ../jai-1_1_3-lib-linux-amd64.tar.gz
    cp -v jai-1_1_3/lib/{jai*,mlibwrapper_jai.jar} $JAVA_HOME/jre/lib/ext/
    cp -v jai-1_1_3/lib/libmlib_jai.so             $JAVA_HOME/jre/lib/amd64/
    ;;
esac

sed -i '\@</javad@i\
<arg value="-Xdoclint:none"/>\
<arg value="--allow-script-in-comments"/>' fop/build.xml

sed -e '/hyph\.stack/s/512k/1M/' \
    -i fop/build.xml

cd fop                    &&
export LC_ALL=en_US.UTF-8 &&

ant compile               &&
ant jar-main              &&
ant jar-hyphenation       &&
ant javadocs              &&
mv build/javadocs .

sed -e '/haltonfailure/s/yes/off/' \
    -i build.xml

install -v -d -m755 -o root -g root          /opt/fop-2.2 &&
cp -v  ../{KEYS,LICENSE,NOTICE,README}       /opt/fop-2.2 &&
cp -vR build conf examples fop* javadocs lib /opt/fop-2.2 &&
chmod a+x /opt/fop-2.2/fop                                &&

ln -v -sfn fop-2.2 /opt/fop

test -e ~/.foprc || \
cat > ~/.foprc << "EOF"
FOP_OPTS="-Xmx3828m"
FOP_HOME="/opt/fop"
EOF

grep -q fop /etc/profile || \
cat >> /etc/profile << "EOF"
export PATH=$PATH:/opt/fop
EOF

popd
rm -rf fop-2.2
