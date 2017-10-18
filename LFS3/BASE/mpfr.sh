set -eo nounset
set +h

cd /sources

rm -rf mpfr-3.1.6
tar xf mpfr-3.1.6.tar.xz
pushd  mpfr-3.1.6

./configure --prefix=/usr        \
            --disable-static     \
            --enable-thread-safe \
            --docdir=/usr/share/doc/mpfr-3.1.6

make
make html

# TODO do not skip
#make check

make install
make install-html

popd
rm -rf mpfr-3.1.6
