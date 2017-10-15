set -eo nounset

cd /sources

for k in \
https://launchpad.net/debian/+archive/primary/+files/junit4_4.11.orig.tar.gz \
http://repo1.maven.org/maven2/org/hamcrest/hamcrest-core/1.3/hamcrest-core-1.3.jar \
http://repo1.maven.org/maven2/org/hamcrest/hamcrest-core/1.3/hamcrest-core-1.3-sources.jar ; do
test -f `basename $k` || \
wget --no-check-certificate \
	$k
done

rm -rf junit4_4.11.orig
tar xf junit4_4.11.orig.tar.gz
rm -rf junit4_4.11.orig

sed -i '\@/docs/@a<arg value="-Xdoclint:none"/>' build.xml

cp -v ../hamcrest-core-1.3{,-sources}.jar lib/ &&
ant populate-dist

install -v -m755 -d /usr/share/{doc,java}/junit-4.11 &&
chown -R root:root .                                 &&

cp -v -R junit*/javadoc/*             /usr/share/doc/junit-4.11  &&
cp -v junit*/junit*.jar               /usr/share/java/junit-4.11

popd
rm -rf junit4_4.11.orig
