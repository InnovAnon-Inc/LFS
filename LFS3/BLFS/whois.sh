set -eo nounset

cd /sources

test -f whois_5.2.18.tar.xz || \
wget --no-check-certificate \
	http://ftp.debian.org/debian/pool/main/w/whois/whois_5.2.18.tar.xz

rm -rf whois-5.2.18
tar xf whois_5.2.18.tar.xz
pushd whois-5.2.18

make

make prefix=/usr install-whois
make prefix=/usr install-mkpasswd
make prefix=/usr install-pos

popd
rm -rf whois-5.2.18
