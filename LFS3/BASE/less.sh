set -eo nounset
set +h

cd /sources

rm -rf less-487
tar xf less-487.tar.gz
pushd  less-487

./configure --prefix=/usr --sysconfdir=/etc

make

make install

popd
rm -rf less-487
