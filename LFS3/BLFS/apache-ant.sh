set -eo nounset

cd /sources

for k in \
https://archive.apache.org/dist/ant/source/apache-ant-1.10.1-src.tar.xz \
http://repo1.maven.org/maven2/junit/junit/4.11/junit-4.11.jar \
 http://repo1.maven.org/maven2/org/hamcrest/hamcrest-core/1.3/hamcrest-core-1.3.jar ; do
test -f `basename $k` || \
wget --no-check-certificate \
	$k
done

rm -rf apache-ant-1.10.1-src
tar xf apache-ant-1.10.1-src.tar.xz
pushd  apache-ant-1.10.1-src

cp -v ../junit-4.11.jar \
      ../hamcrest-core-1.3.jar lib/optional

./build.sh -Ddist.dir=/opt/ant-1.10.1 dist
ln -v -sfn ant-1.10.1 /opt/ant

test ! -z ${JAVA_HOME+x}

test -f /etc/profile.d/ant.sh || \
cat > /etc/profile.d/ant.sh << EOF
# Begin /etc/profile.d/ant.sh

pathappend /opt/ant/bin
export ANT_HOME=/opt/ant

# End /etc/profile.d/ant.sh
EOF

popd
rm -rf apache-ant-1.10.1-src
