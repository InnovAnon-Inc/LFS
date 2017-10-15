set -eo nounset

cd /sources

test -f heirloom-070715.tar.bz2 || \
wget --no-check-certificate \
	http://downloads.sourceforge.net/heirloom/heirloom-070715.tar.bz2

rm -rf heirloom-070715
tar xf heirloom-070715.tar.bz2
pushd  heirloom-070715

sed -i build/mk.config                   \
    -e '/LIBZ/s@ -Wl[^ ]*@@g'            \
    -e '/LIBBZ2/{s@^#@@;s@ -Wl[^ ]*@@g}' \
    -e '/BZLIB/s@0@1@'                   &&

make makefiles                           &&
make -C libcommon                        &&
make -C libuxre                          &&
make -C cpio

install -v -m755 cpio/pax_su3 /usr/bin/pax &&
install -v -m644 cpio/pax.1 /usr/share/man/man1

popd
rm -rf heirloom-070715
