set -eo nounset

cd /sources

test -f qpdf-7.0.0.tar.gz || \
wget --no-check-certificate \
	https://downloads.sourceforge.net/qpdf/qpdf-7.0.0.tar.gz

rm -rf qpdf-7.0.0
tar xf qpdf-7.0.0.tar.gz
pushd  qpdf-7.0.0

./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/qpdf-7.0.0 &&
make

make install

popd
rm -rf qpdf-7.0.0
