set -eo nounset

cd /sources

for k in \
https://www.python.org/ftp/python/3.6.2/Python-3.6.2.tar.xz \
https://docs.python.org/ftp/python/doc/3.6.2/python-3.6.2-docs-html.tar.bz2 ; do
test -f `basename $k` || \
wget --no-check-certificate \
	$k
done

rm -rf Python-3.6.2
tar xf Python-3.6.2.tar.xz
pushd Python-3.6.2

export PYTHONIOENCODING=utf-8

CXX="/usr/bin/g++"              \
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
tar --strip-components=1 \
    --no-same-owner \
    --no-same-permissions \
    -C /usr/share/doc/python-3.6.2/html \
    -xvf ../python-3.6.2-docs-html.tar.bz2

ln -svfn python-3.6.2 /usr/share/doc/python-3

grep -q ^PYTHONDOCS= /etc/profile || \
cat >> /etc/profile << "EOF"
export PYTHONDOCS=/usr/share/doc/python-3/html
EOF

popd
rm -rf Python-3.6.2
