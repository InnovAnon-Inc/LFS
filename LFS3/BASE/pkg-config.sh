set -eo nounset

cd /sources

rm -rf pkg-config-0.29.2
tar xf pkg-config-0.29.2.tar.gz
pushd  pkg-config-0.29.2

./configure --prefix=/usr              \
            --with-internal-glib       \
            --disable-host-tool        \
            --docdir=/usr/share/doc/pkg-config-0.29.2

make

#make check

make install

popd
rm -rf pkg-config-0.29.2
