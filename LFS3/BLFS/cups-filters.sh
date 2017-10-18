set -eo nounset

cd /sources

test -f cups-filters-1.17.5.tar.xz || \
wget --no-check-certificate \
	https://www.openprinting.org/download/cups-filters/cups-filters-1.17.5.tar.xz

rm -rf cups-filters-1.17.5
tar xf cups-filters-1.17.5.tar.xz
pushd  cups-filters-1.17.5

./configure                  \
        --prefix=/usr        \
        --sysconfdir=/etc    \
        --localstatedir=/var \
        --without-rcdir      \
        --disable-static     \
        --disable-avahi      \
        --docdir=/usr/share/doc/cups-filters-1.17.5 &&
make

make install

popd
rm -rf cups-filters-1.17.5
