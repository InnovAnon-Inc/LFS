set -eo nounset

cd /sources

rm -rf file-5.32
tar xf file-5.32.tar.gz
pushd  file-5.32

./configure --prefix=/usr

make

#make check

make install

popd
rm -rf file-5.32
