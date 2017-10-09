set -eo nounset

cd /sources

test -f pth-2.0.7.tar.gz || \
wget --no-check-certificate \
    https://ftp.gnu.org/gnu/pth/pth-2.0.7.tar.gz

rm -rf pth-2.0.7
tar xf pth-2.0.7.tar.gz
pushd pth-2.0.7

sed -i 's#$(LOBJS): Makefile#$(LOBJS): pth_p.h Makefile#' Makefile.in
./configure --prefix=/usr           \
            --disable-static        \
            --mandir=/usr/share/man
make

make install
install -v -m755 -d /usr/share/doc/pth-2.0.7
install -v -m644    README PORTING SUPPORT TESTS \
                    /usr/share/doc/pth-2.0.7

popd
rm -rf pth-2.0.7
