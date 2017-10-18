set -eo nounset
set +h

cd /sources

rm -rf automake-1.15.1
tar xf automake-1.15.1.tar.xz
pushd  automake-1.15.1

./configure --prefix=/usr --docdir=/usr/share/doc/automake-1.15.1

make

sed -i "s:./configure:LEXLIB=/usr/lib/libfl.a &:" t/lex-{clean,depend}-cxx.sh
# TODO don't lower this unnecessarily
#make -j4 check

make install

popd
rm -rf automake-1.15.1
