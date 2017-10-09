set -eo nounset

cd /sources

test -f traceroute-2.1.0.tar.gz || \
wget --no-check-certificate \
	 http://downloads.sourceforge.net/traceroute/traceroute-2.1.0.tar.gz
#	 https://downloads.sourceforge.net/traceroute/traceroute-2.1.0.tar.gz

rm -rf traceroute-2.1.0
tar xf traceroute-2.1.0.tar.gz
pushd traceroute-2.1.0

make

make prefix=/usr install
mv /usr/bin/traceroute /bin
ln -sv -f traceroute /bin/traceroute6
ln -sv -f traceroute.8 /usr/share/man/man8/traceroute6.8
rm -fv /usr/share/man/man1/traceroute.1

popd
rm -rf traceroute-2.1.0
