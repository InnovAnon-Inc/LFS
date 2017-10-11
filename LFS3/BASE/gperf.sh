set -eo nounset

cd /sources

rm -rf gperf-3.1
tar xf gperf-3.1.tar.gz
pushd  gperf-3.1

./configure --prefix=/usr --docdir=/usr/share/doc/gperf-3.1

make

#make -j1 check

make install

popd
rm -rf gperf-3.1
