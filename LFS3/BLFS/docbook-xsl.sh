set -eo nounset

cd /sources

for k in \
http://downloads.sourceforge.net/docbook/docbook-xsl-1.79.1.tar.bz2 \
http://downloads.sourceforge.net/docbook/docbook-xsl-doc-1.79.1.tar.bz2 ; do
test -f `basename $k` || \
wget --no-check-certificate \
	$k
done

rm -rf docbook-xsl-1.79.1
tar xf docbook-xsl-1.79.1.tar.bz2
pushd  docbook-xsl-1.79.1

tar -xf ../docbook-xsl-doc-1.79.1.tar.bz2 --strip-components=1

install -v -m755 -d /usr/share/xml/docbook/xsl-stylesheets-1.79.1 &&

cp -v -R VERSION assembly common eclipse epub epub3 extensions fo        \
         highlighting html htmlhelp images javahelp lib manpages params  \
         profiling roundtrip slides template tests tools webhelp website \
         xhtml xhtml-1_1 xhtml5                                          \
    /usr/share/xml/docbook/xsl-stylesheets-1.79.1 &&

ln -s VERSION /usr/share/xml/docbook/xsl-stylesheets-1.79.1/VERSION.xsl &&

install -v -m644 -D README \
                    /usr/share/doc/docbook-xsl-1.79.1/README.txt &&
install -v -m644    RELEASE-NOTES* NEWS* \
                    /usr/share/doc/docbook-xsl-1.79.1

cp -v -R doc/* /usr/share/doc/docbook-xsl-1.79.1

if [ ! -d /etc/xml ]; then install -v -m755 -d /etc/xml; fi &&
if [ ! -f /etc/xml/catalog ]; then
    xmlcatalog --noout --create /etc/xml/catalog
fi &&

xmlcatalog --noout --add "rewriteSystem" \
           "http://docbook.sourceforge.net/release/xsl/1.79.1" \
           "/usr/share/xml/docbook/xsl-stylesheets-1.79.1" \
    /etc/xml/catalog &&

xmlcatalog --noout --add "rewriteURI" \
           "http://docbook.sourceforge.net/release/xsl/1.79.1" \
           "/usr/share/xml/docbook/xsl-stylesheets-1.79.1" \
    /etc/xml/catalog &&

xmlcatalog --noout --add "rewriteSystem" \
           "http://docbook.sourceforge.net/release/xsl/current" \
           "/usr/share/xml/docbook/xsl-stylesheets-1.79.1" \
    /etc/xml/catalog &&

xmlcatalog --noout --add "rewriteURI" \
           "http://docbook.sourceforge.net/release/xsl/current" \
           "/usr/share/xml/docbook/xsl-stylesheets-1.79.1" \
    /etc/xml/catalog

#xmlcatalog --noout --add "rewriteSystem" \
#           "http://docbook.sourceforge.net/release/xsl/<version>" \
#           "/usr/share/xml/docbook/xsl-stylesheets-<version>" \
#    /etc/xml/catalog &&
#
#xmlcatalog --noout --add "rewriteURI" \
#           "http://docbook.sourceforge.net/release/xsl/<version>" \
#           "/usr/share/xml/docbook/xsl-stylesheets-<version>" \
#    /etc/xml/catalog

popd
rm -rf docbook-xsl-1.79.1
