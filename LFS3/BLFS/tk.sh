set -eo nounset

cd /sources

test -f tk8.6.7-src.tar.gz || \
wget --no-check-certificate \
	https://downloads.sourceforge.net/tcl/tk8.6.7-src.tar.gz

rm -rf tk8.6.7
tar xf tk8.6.7-src.tar.gz
pushd  tk8.6.7

cd unix
./configure --prefix=/usr \
            --mandir=/usr/share/man \
            $([ $(uname -m) = x86_64 ] && echo --enable-64bit)

make

sed -e "s@^\(TK_SRC_DIR='\).*@\1/usr/include'@" \
    -e "/TK_B/s@='\(-L\)\?.*unix@='\1/usr/lib@" \
    -i tkConfig.sh

make install
make install-private-headers
ln -v -sf wish8.6 /usr/bin/wish
chmod -v 755 /usr/lib/libtk8.6.so
popd
rm -rf tk8.6.7

