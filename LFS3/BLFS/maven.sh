set -eo nounset

cd /sources

for k in \
http://apache.spinellicreations.com/maven/maven-3/3.5.0/binaries/apache-maven-3.5.0-bin.tar.gz \
http://apache.spinellicreations.com/maven/maven-3/3.5.0/source/apache-maven-3.5.0-src.tar.gz ; do
test -f `basename $k` || \
wget --no-check-certificate \
	$k
done

rm -rf apache-maven-3.5.0
tar xf apache-maven-3.5.0-bin.tar.gz
mv     apache-maven-3.5.0 apache-maven-bin

rm -rf apache-maven-3.5.0
tar xf apache-maven-3.5.0-src.tar.gz
pushd  apache-maven-3.5.0

../apache-maven-bin/bin/mvn clean package

popd
rm -rf apache-maven-3.5.0{,-bin}
