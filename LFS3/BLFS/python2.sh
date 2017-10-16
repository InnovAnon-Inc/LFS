set -eo nounset

cd /sources

for k in \
https://www.python.org/ftp/python/2.7.14/Python-2.7.14.tar.xz \
https://docs.python.org/ftp/python/doc/2.7.14/python-2.7.14-docs-html.tar.bz2 ; do
test -f `basename $k` || \
wget --no-check-certificate \
	$k
done

rm -rf Python-2.7.14
tar xf Python-2.7.14.tar.xz
pushd Python-2.7.14

export PYTHONIOENCODING=utf-8

./configure --prefix=/usr       \
            --enable-shared     \
            --with-system-expat \
            --with-system-ffi   \
            --with-ensurepip=yes \
            --enable-unicode=ucs4
make

make install
chmod -v 755 /usr/lib/libpython2.7.so.1.0

install -v -dm755 /usr/share/doc/python-2.7.14

tar --strip-components=1                     \
    --no-same-owner                          \
    --directory /usr/share/doc/python-2.7.14 \
    -xvf ../python-2.7.14-docs-html.tar.bz2

find /usr/share/doc/python-2.7.14 -type d -exec chmod 0755 {} \;
find /usr/share/doc/python-2.7.14 -type f -exec chmod 0644 {} \;

grep -q ^PYTHONDOCS= /etc/profile || \
cat >> /etc/profile << "EOF"
export PYTHONDOCS=/usr/share/doc/python-2.7.14
EOF

popd
rm -rf Python-2.7.14
