set -eo nounset

cd /sources

test -f openjpeg-1.5.2.tar.gz || \
wget --no-check-certificate \
	http://downloads.sourceforge.net/openjpeg.mirror/openjpeg-1.5.2.tar.gz

rm -rf openjpeg-1.5.2
tar xf openjpeg-1.5.2.tar.gz
pushd  openjpeg-1.5.2

autoreconf -f -i &&
./configure --prefix=/usr --disable-static &&
make

make install

popd
rm -rf openjpeg-1.5.2
