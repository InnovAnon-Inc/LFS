set -eo nounset

cd /sources

for k in \
https://downloads.sourceforge.net/w3m/w3m-0.5.3.tar.gz \
http://www.linuxfromscratch.org/patches/blfs/svn/w3m-0.5.3-bdwgc72-1.patch ; do
test -f `basename $k` || \
wget --no-check-certificate \
	$k
done

rm -rf w3m-0.5.3
tar xf w3m-0.5.3.tar.gz
pushd  w3m-0.5.3

patch -Np1 -i ../w3m-0.5.3-bdwgc72-1.patch
sed -i 's/file_handle/file_foo/' istream.{c,h}
sed -i 's#gdk-pixbuf-xlib-2.0#& x11#' configure

PKG_CONFIG_PATH="/usr/lib/openssl-1.0/pkgconfig:$PKG_CONFIG_PATH" \
    ./configure --prefix=/usr --sysconfdir=/etc
make

make install
install -v -m644 -D doc/keymap.default /etc/w3m/keymap
install -v -m644    doc/menu.default /etc/w3m/menu
install -v -m755 -d /usr/share/doc/w3m-0.5.3
install -v -m644    doc/{HISTORY,READ*,keymap.*,menu.*,*.html} \
                    /usr/share/doc/w3m-0.5.3

popd
rm -rf w3m-0.5.3
