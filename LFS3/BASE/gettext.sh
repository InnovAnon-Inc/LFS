set -eo nounset
set +h

cd /sources

rm -rf gettext-0.19.8.1
tar xf gettext-0.19.8.1.tar.xz
pushd  gettext-0.19.8.1

sed -i '/^TESTS =/d' gettext-runtime/tests/Makefile.in &&
sed -i 's/test-lock..EXEEXT.//' gettext-tools/gnulib-tests/Makefile.in

./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/gettext-0.19.8.1

make

#make check

make install
chmod -v 0755 /usr/lib/preloadable_libintl.so

popd
rm -rf gettext-0.19.8.1
