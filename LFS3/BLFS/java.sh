set -eo nounset

cd /sources

wget --no-check-certificate \
	http://anduin.linuxfromscratch.org/BLFS/OpenJDK/OpenJDK-1.8.0.141/OpenJDK-1.8.0.141-x86_64-bin.tar.xz

rm -rf OpenJDK-1.8.0.141-x86_64-bin
tar xf OpenJDK-1.8.0.141-x86_64-bin.tar.xz
pushd  OpenJDK-1.8.0.141-x86_64-bin

install -vdm755 /opt/OpenJDK-1.8.0.141-bin
mv -v * /opt/OpenJDK-1.8.0.141-bin
chown -R root:root /opt/OpenJDK-1.8.0.141-bin

ln -sfn OpenJDK-1.8.0.141-bin /opt/jdk

popd
rm -rf OpenJDK-1.8.0.141-x86_64-bin

