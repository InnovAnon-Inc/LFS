set -eo nounset

# required libxml2
cd /sources

test -f libxslt-1.1.30.tar.gz || \
wget --no-check-certificate \
	http://xmlsoft.org/sources/libxslt-1.1.30.tar.gz

rm -rf libxslt-1.1.30
tar xf libxslt-1.1.30.tar.gz
pushd  libxslt-1.1.30

sed -i s/3000/5000/ libxslt/transform.c doc/xsltproc.{1,xml}
sed -i '/WITH_MODULES=.*--variable/ a \\t\tXML_CONFIG="$PKG_CONFIG libxml-2.0"' \
 configure.in
autoreconf -fiv
./configure --prefix=/usr --disable-static
make

make install

popd
rm -rf libxslt-1.1.30
