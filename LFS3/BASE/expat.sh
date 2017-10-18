set -eo nounset
set +h

cd /sources

rm -rf expat-2.2.4
tar xf expat-2.2.4.tar.bz2
pushd  expat-2.2.4

sed -i 's|usr/bin/env |bin/|' run.sh.in

./configure --prefix=/usr --disable-static

make

#make check

make install

install -v -dm755 /usr/share/doc/expat-2.2.4
install -v -m644 doc/*.{html,png,css} /usr/share/doc/expat-2.2.4

popd
rm -rf expat-2.2.4
