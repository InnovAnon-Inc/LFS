set -eo nounset

cd /sources

test -f nspr-4.17.tar.gz || \
wget --no-check-certificate \
	https://archive.mozilla.org/pub/nspr/releases/v4.17/src/nspr-4.17.tar.gz

rm -rf nspr-4.17
tar xf nspr-4.17.tar.gz
pushd  nspr-4.17

cd nspr
sed -ri 's#^(RELEASE_BINS =).*#\1#' pr/src/misc/Makefile.in
sed -i 's#$(LIBRARY) ##'            config/rules.mk

./configure --prefix=/usr \
            --with-mozilla \
            --with-pthreads \
            $([ $(uname -m) = x86_64 ] && echo --enable-64bit)
make

make install

popd
rm -rf nspr-4.17

