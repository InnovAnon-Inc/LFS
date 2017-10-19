set -eo nounset

cd /sources

test -f libidn-1.33.tar.gz || \
wget --no-check-certificate \
	https://ftp.gnu.org/gnu/libidn/libidn-1.33.tar.gz

rm -rf libidn-1.33
tar xf libidn-1.33.tar.gz
pushd  libidn-1.33

./configure --prefix=/usr --disable-static &&
make

make install &&

find doc -name "Makefile*" -delete            &&
rm -rf -v doc/{gdoc,idn.1,stamp-vti,man,texi} &&
mkdir -v       /usr/share/doc/libidn-1.33     &&
cp -r -v doc/* /usr/share/doc/libidn-1.33

popd
rm -rf libidn-1.33
