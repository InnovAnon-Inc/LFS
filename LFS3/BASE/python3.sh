set -eo nounset

cd /sources

rm -rf Python-3.6.2
tar xf Python-3.6.2.tar.xz
pushd  Python-3.6.2

./configure --prefix=/usr       \
            --enable-shared     \
            --with-system-expat \
            --with-system-ffi   \
            --with-ensurepip=yes

make

make install
chmod -v 755 /usr/lib/libpython3.6m.so
chmod -v 755 /usr/lib/libpython3.so

install -v -dm755 /usr/share/doc/python-3.6.2/html

tar --strip-components=1  \
    --no-same-owner       \
    --no-same-permissions \
    -C /usr/share/doc/python-3.6.2/html \
    -xvf ../python-3.6.2-docs-html.tar.bz2

popd
rm -rf Python-3.6.2
