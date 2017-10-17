set -eo nounset

cd /sources

test -f pngnq-1.1.tar.gz || \
wget --no-check-certificate \
	https://downloads.sourceforge.net/project/pngnq/pngnq/1.1/pngnq-1.1.tar.gz

rm -rf pngnq-1.1
tar xf pngnq-1.1.tar.gz
pushd  pngnq-1.1

./autogen.sh
./configure
make
make install

popd
rm -rf pngnq-1.1
