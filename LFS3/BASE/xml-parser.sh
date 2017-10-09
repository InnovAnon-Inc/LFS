set -eo nounset

cd /sources

rm -rf XML-Parser-2.44
tar xf XML-Parser-2.44.tar.gz
pushd  XML-Parser-2.44

perl Makefile.PL

make

#make test

make install

popd
rm -rf XML-Parser-2.44
