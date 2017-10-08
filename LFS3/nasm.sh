cd /sources

for k in \
http://www.nasm.us/pub/nasm/releasebuilds/2.13.01/nasm-2.13.01.tar.xz \
http://www.nasm.us/pub/nasm/releasebuilds/2.13.01/nasm-2.13.01-xdoc.tar.xz ; do
test -f `basename $k` || \
wget --no-check-certificate \
	$k
done

rm -rf nasm-2.13.01
tar xf nasm-2.13.01.tar.xz
cd nasm-2.13.01

tar -xf ../nasm-2.13.01-xdoc.tar.xz --strip-components=1

./configure --prefix=/usr
make

make install

install -m755 -d         /usr/share/doc/nasm-2.13.01/html
cp -v doc/html/*.html    /usr/share/doc/nasm-2.13.01/html
cp -v doc/*.{txt,ps,pdf} /usr/share/doc/nasm-2.13.01
