set -eo nounset

cd /sources

test -f svgalib-1.4.3.tar.gz || \
wget --no-check-certificate \
	http://www.svgalib.org/svgalib-1.4.3.tar.gz

rm -rf svgalib-1.4.3
tar xf svgalib-1.4.3.tar.gz
pushd  svgalib-1.4.3

make
make install

popd
rm -rf svgalib-1.4.3
