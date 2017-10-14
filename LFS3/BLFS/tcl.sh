set -eo nounset

cd /sources

for k in \
http://downloads.sourceforge.net/tcl/tcl8.6.7-src.tar.gz \
http://downloads.sourceforge.net/tcl/tcl8.6.7-html.tar.gz ; do
test -f `basename $k` || \
wget --no-check-certificate \
	$k
done

rm -rf tcl8.6.7
tar xf tcl8.6.7-src.tar.gz
pushd  tcl8.6.7

tar -xf ../tcl8.6.7-html.tar.gz --strip-components=1

export SRCDIR=`pwd`

cd unix

./configure --prefix=/usr           \
            --mandir=/usr/share/man \
            $([ $(uname -m) = x86_64 ] && echo --enable-64bit)
make

sed -e "s#$SRCDIR/unix#/usr/lib#" \
    -e "s#$SRCDIR#/usr/include#"  \
    -i tclConfig.sh

sed -e "s#$SRCDIR/unix/pkgs/tdbc1.0.5#/usr/lib/tdbc1.0.5#" \
    -e "s#$SRCDIR/pkgs/tdbc1.0.5/generic#/usr/include#"    \
    -e "s#$SRCDIR/pkgs/tdbc1.0.5/library#/usr/lib/tcl8.6#" \
    -e "s#$SRCDIR/pkgs/tdbc1.0.5#/usr/include#"            \
    -i pkgs/tdbc1.0.5/tdbcConfig.sh

sed -e "s#$SRCDIR/unix/pkgs/itcl4.1.0#/usr/lib/itcl4.1.0#" \
    -e "s#$SRCDIR/pkgs/itcl4.1.0/generic#/usr/include#"    \
    -e "s#$SRCDIR/pkgs/itcl4.1.0#/usr/include#"            \
    -i pkgs/itcl4.1.0/itclConfig.sh

unset SRCDIR

make install
make install-private-headers
ln -v -sf tclsh8.6 /usr/bin/tclsh
chmod -v 755 /usr/lib/libtcl8.6.so

mkdir -v -p /usr/share/doc/tcl-8.6.7
cp -v -r  ../html/* /usr/share/doc/tcl-8.6.7

popd
rm -rf tcl8.6.7

