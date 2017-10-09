set -eo nounset

cd /sources

test -f asciidoc-8.6.9.tar.gz || \
wget --no-check-certificate \
	http://downloads.sourceforge.net/asciidoc/asciidoc-8.6.9.tar.gz

rm -rf asciidoc-8.6.9
tar xf asciidoc-8.6.9.tar.gz
pushd  asciidoc-8.6.9

./configure --prefix=/usr     \
            --sysconfdir=/etc \
            --docdir=/usr/share/doc/asciidoc-8.6.9
make

make install
make docs

popd
rm -rf asciidoc-8.6.9
