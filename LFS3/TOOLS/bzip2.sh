set -eo nounset

cd /sources

rm -rf bzip2-1.0.6
tar xf bzip2-1.0.6.tar.gz
pushd  bzip2-1.0.6

make

make PREFIX=/tools install

popd
rm -rf bzip2-1.0.6
