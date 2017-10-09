set -eo nounset

cd /sources

test -f tcp_wrappers_7.6.tar.gz || \
wget --no-check-certificate \
	ftp://ftp.porcupine.org/pub/security/tcp_wrappers_7.6.tar.gz

rm -rf tcp_wrappers_7.6
tar xf tcp_wrappers_7.6.tar.gz
pushd  tcp_wrappers_7.6

echo TODO
exit 2

popd
rm -rf tcp_wrappers_7.6
