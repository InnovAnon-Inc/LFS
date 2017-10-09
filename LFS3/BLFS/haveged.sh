set -eo nounset

cd /sources

test -f haveged-1.9.1.tar.gz || \
wget --no-check-certificate \
	https://downloads.sourceforge.net/haveged/haveged-1.9.1.tar.gz

rm -rf haveged-1.9.1
tar xf haveged-1.9.1.tar.gz
pushd  haveged-1.9.1

./configure --prefix=/usr
make

make install
mkdir -pv    /usr/share/doc/haveged-1.9.1
cp -v README /usr/share/doc/haveged-1.9.1

make install-haveged

popd
rm -rf haveged-1.9.1
