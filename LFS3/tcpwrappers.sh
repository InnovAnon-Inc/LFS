cd /sources

test -f tcp_wrappers_7.6.tar.gz || \
wget --no-check-certificate \
	ftp://ftp.porcupine.org/pub/security/tcp_wrappers_7.6.tar.gz

rm -rf tcp_wrappers_7.6
tar xf tcp_wrappers_7.6.tar.gz
cd tcp_wrappers_7.6

echo TODO
exit 2
