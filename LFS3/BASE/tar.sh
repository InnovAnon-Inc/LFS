set -eo nounset
set +h

cd /sources

rm -rf tar-1.29
tar xf tar-1.29.tar.xz
pushd  tar-1.29

FORCE_UNSAFE_CONFIGURE=1  \
./configure --prefix=/usr \
            --bindir=/bin

make

#make check

make install
make -C doc install-html docdir=/usr/share/doc/tar-1.29

popd
rm -rf tar-1.29
