set -eo nounset
set +h

cd /sources

rm -rf mpc-1.0.3
tar xf mpc-1.0.3.tar.gz
pushd  mpc-1.0.3

./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/mpc-1.0.3

make
make html

#make check

make install
make install-html

popd
rm -rf mpc-1.0.3
