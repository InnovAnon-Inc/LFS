set -eo nounset

cd /sources

rm -rf ncurses-6.0
tar xf ncurses-6.0.tar.gz
pushd  ncurses-6.0

sed -i s/mawk// configure

./configure --prefix=/tools \
            --with-shared   \
            --without-debug \
            --without-ada   \
            --enable-widec  \
            --enable-overwrite

make

make install

popd
rm -rf ncurses-6.0
