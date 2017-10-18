set -eo nounset
set +h

cd /sources

rm -rf flex-2.6.4
tar xf flex-2.6.4.tar.gz
pushd  flex-2.6.4

sed -i "/math.h/a #include <malloc.h>" src/flexdef.h

HELP2MAN=/tools/bin/true \
./configure --prefix=/usr --docdir=/usr/share/doc/flex-2.6.4

make

#make check

make install

ln -sv flex /usr/bin/lex

popd
rm -rf flex-2.6.4
