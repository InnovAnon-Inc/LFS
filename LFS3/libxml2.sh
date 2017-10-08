cd /sources

test -f libxml2-2.9.5.tar.gz || \
wget --no-check-certificate \
	http://xmlsoft.org/sources/libxml2-2.9.5.tar.gz

test -f xmlts20130923.tar.gz || \
wget --no-check-certificate \
	http://www.w3.org/XML/Test/xmlts20130923.tar.gz

rm -rf libxml2-2.9.5
tar xf libxml2-2.9.5.tar.gz
cd libxml2-2.9.5

./configure --prefix=/usr --disable-static --with-history
make

tar xf ../xmlts20130923.tar.gz

/etc/init.d/httpd stop

make install
