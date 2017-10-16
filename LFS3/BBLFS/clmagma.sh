set -eo nounset

cd /sources

test -f clmagma-1.3.0.tar.gz || \
wget --no-check-certificate \
	http://icl.cs.utk.edu/projectsfiles/magma/cl/clmagma-1.3.0.tar.gz

rm -rf clmagma-1.3.0
tar xf clmagma-1.3.0.tar.gz
pushd  clmagma-1.3.0

# TODO maybe edit make.inc
make
make install

popd
rm -rf clmagma-1.3.0
