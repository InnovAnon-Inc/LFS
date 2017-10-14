set -eo nounset

cd /sources

for k in \
http://downloads.sourceforge.net/freetts/freetts-1.2.2-src.zip \
http://downloads.sourceforge.net/freetts/freetts-1.2.2-tst.zip ; do
test -f `basename $k` || \
wget --no-check-certificate \
	$k
done

rm -rf freetts-1.2.2
unzip  freetts-1.2.2-src.zip
#pushd  freetts-1.2.2

unzip -q freetts-1.2.2-src.zip -x META-INF/*
unzip -q freetts-1.2.2-tst.zip -x META-INF/*

pushd  freetts-1.2.2

sed -i 's/value="src/value="./' build.xml
cd lib
sh jsapi.sh
cd ..
ant

install -v -m755 -d /opt/freetts-1.2.2/{lib,docs/{audio,images}}
install -v -m644 lib/*.jar /opt/freetts-1.2.2/lib
install -v -m644 *.txt RELEASE_NOTES docs/*.{pdf,html,txt,sx{w,d}} \
                               /opt/freetts-1.2.2/docs
install -v -m644 docs/audio/*  /opt/freetts-1.2.2/docs/audio
install -v -m644 docs/images/* /opt/freetts-1.2.2/docs/images
cp -v -R javadoc               /opt/freetts-1.2.2
ln -v -s freetts-1.2.2 /opt/freetts

cp -v -R bin    /opt/freetts-1.2.2
install -v -m644 speech.properties $JAVA_HOME/jre/lib
cp -v -R tools  /opt/freetts-1.2.2
cp -v -R mbrola /opt/freetts-1.2.2
cp -v -R demo   /opt/freetts-1.2.2

java -jar /opt/freetts/lib/freetts.jar \
     -text "This is a test of the FreeTTS speech synthesis system"

java -jar /opt/freetts/lib/freetts.jar -streaming \
     -text "This is a test of the FreeTTS speech synthesis system"

popd
rm -rf freetts-1.2.2

