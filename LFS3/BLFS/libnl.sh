set -eo nounset

cd /sources

test -f libnl-3.4.0.tar.gz || \
for k in \
https://github.com/thom311/libnl/releases/download/libnl3_4_0/libnl-3.4.0.tar.gz \
https://github.com/thom311/libnl/releases/download/libnl3_4_0/libnl-doc-3.4.0.tar.gz ; do
test -f `basename $k` || \
wget --no-check-certificate \
	$k
done

rm -rf libnl-3.4.0
tar xf libnl-3.4.0.tar.gz
pushd  libnl-3.4.0

./configure --prefix=/usr     \
            --sysconfdir=/etc \
            --disable-static  &&
make

make install

mkdir -vp /usr/share/doc/libnl-3.4.0 &&
tar -xf ../libnl-doc-3.4.0.tar.gz --strip-components=1 --no-same-owner \
    -C  /usr/share/doc/libnl-3.4.0

popd
rm -rf libnl-3.4.0
