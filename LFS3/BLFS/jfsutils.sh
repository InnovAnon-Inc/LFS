set -eo nounset

cd /sources

test -f jfsutils-1.1.15.tar.gz || \
wget --no-check-certificate \
	 http://jfs.sourceforge.net/project/pub/jfsutils-1.1.15.tar.gz

rm -rf jfsutils-1.1.15
tar xf jfsutils-1.1.15.tar.gz
pushd  jfsutils-1.1.15

sed "s@<unistd.h>@&\n#include <sys/types.h>@g" -i fscklog/extract.c &&
./configure &&
make

make install

popd
rm -rf jfsutils-1.1.15
