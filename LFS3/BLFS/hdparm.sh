set -eo nounset

cd /sources

test -f hdparm-9.52.tar.gz || \
wget --no-check-certificate \
	http://downloads.sourceforge.net/hdparm/hdparm-9.52.tar.gz

rm -rf hdparm-9.52
tar xf hdparm-9.52.tar.gz
pushd  hdparm-9.52

make

make install

#make binprefix=/usr install

popd
rm -rf hdparm-9.52
