set -eo nounset

cd /sources

test -f cpio-2.12.tar.bz2 || \
wget --no-check-certificate \
	https://ftp.gnu.org/gnu/cpio/cpio-2.12.tar.bz2

rm -rf cpio-2.12
tar xf cpio-2.12.tar.bz2
pushd  cpio-2.12

./configure --prefix=/usr \
            --bindir=/bin \
            --enable-mt   \
            --with-rmt=/usr/libexec/rmt
make
makeinfo --html            -o doc/html      doc/cpio.texi
makeinfo --html --no-split -o doc/cpio.html doc/cpio.texi
makeinfo --plaintext       -o doc/cpio.txt  doc/cpio.texi

#make -C doc pdf
#make -C doc ps

make install
install -v -m755 -d /usr/share/doc/cpio-2.12/html
install -v -m644    doc/html/* \
                    /usr/share/doc/cpio-2.12/html
install -v -m644    doc/cpio.{html,txt} \
                    /usr/share/doc/cpio-2.12

install -v -m644 doc/cpio.{pdf,ps,dvi} \
                 /usr/share/doc/cpio-2.12

popd
rm -rf cpio-2.12

