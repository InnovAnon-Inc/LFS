set -eo nounset

cd /sources

test -f lsb-release-1.4.tar.gz || \
wget --no-check-certificate \
	http://downloads.sourceforge.net/lsb/lsb-release-1.4.tar.gz

rm -rf lsb-release-1.4
tar xf lsb-release-1.4.tar.gz
pushd  lsb-release-1.4

sed -i "s|n/a|unavailable|" lsb_release

./help2man -N --include ./lsb_release.examples \
              --alt_version_key=program_version ./lsb_release > lsb_release.1

install -v -m 644 lsb_release.1 /usr/share/man/man1
install -v -m 755 lsb_release   /usr/bin
install -v -m 755 help2man      /usr/bin

popd
rm -rf lsb-release-1.4

