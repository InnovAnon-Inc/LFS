set -eo nounset

cd /sources

#test -f
#wget

rm -rf dblatex-0.3.10
tar xf dblatex-0.3.10.tar.bz2
pushd  dblatex-0.3.10

python setup.py install --prefix=/usr

popd
rm -rf dblatex-0.3.10
