set -eo nounset
set +h

cd /sources

rm -rf iana-etc-2.30
tar xf iana-etc-2.30.tar.bz2
pushd  iana-etc-2.30

make

make install

popd
rm -rf iana-etc-2.30
