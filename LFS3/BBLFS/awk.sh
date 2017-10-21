set -eo nounset

cd /sources

test -f awk.tar.gz || \
wget --no-check-certificate \
	http://www.cs.princeton.edu/~bwk/btl.mirror/awk.tar.gz

rm -rf awk
tar xf awk.tar.gz
pushd  awk

# not using standard prefix
./configure --prefix=/usr/local
make
make install

popd
rm -rf awk
