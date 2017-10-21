set -eo nounset

cd /sources

test -f jbig2dec-0.14.tar.gz || \
wget --no-check-certificate \
	http://downloads.ghostscript.com/public/jbig2dec/jbig2dec-0.14.tar.gz

rm -rf jbig2dec-0.14
tar xf jbig2dec-0.14.tar.gz
pushd  jbig2dec-0.14

./configure --prefix=/usr
make
make install

popd
rm -rf jbig2dec-0.14
