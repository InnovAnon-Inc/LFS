set -eo nounset

cd /sources

for k in \
https://ftp.gnu.org/gnu/parted/parted-3.2.tar.xz \
http://www.linuxfromscratch.org/patches/blfs/svn/parted-3.2-devmapper-1.patch ; do
test -f `basename $k` || \
wget --no-check-certificate \
	$k
done

rm -rf parted-3.2
tar xf parted-3.2.tar.xz
pushd  parted-3.2

patch -Np1 -i ../parted-3.2-devmapper-1.patch

./configure --prefix=/usr --disable-static &&
make &&

make -C doc html                                       &&
makeinfo --html      -o doc/html       doc/parted.texi &&
makeinfo --plaintext -o doc/parted.txt doc/parted.texi

texi2pdf             -o doc/parted.pdf doc/parted.texi &&
texi2dvi             -o doc/parted.dvi doc/parted.texi &&
dvips                -o doc/parted.ps  doc/parted.dvi

sed -i '/t0251-gpt-unicode.sh/d' tests/Makefile

make install &&
install -v -m755 -d /usr/share/doc/parted-3.2/html &&
install -v -m644    doc/html/* \
                    /usr/share/doc/parted-3.2/html &&
install -v -m644    doc/{FAT,API,parted.{txt,html}} \
                    /usr/share/doc/parted-3.2

install -v -m644 doc/FAT doc/API doc/parted.{pdf,ps,dvi} \
                    /usr/share/doc/parted-3.2

popd
rm -rf parted-3.2
