set -eo nounset

cd /sources

test -f tor-0.3.1.7.tar.gz || \
wget --no-check-certificate \
	https://dist.torproject.org/tor-0.3.1.7.tar.gz

rm -rf tor-0.3.1.7
tar xf tor-0.3.1.7.tar.gz
pushd  tor-0.3.1.7

echo TODO
exit 2

popd
rm -rf tor-0.3.1.7
