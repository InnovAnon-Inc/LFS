set -eo nounset

cd /sources

test -f which-2.21.tar.gz || \
wget --no-check-certificate \
	https://ftp.gnu.org/gnu/which/which-2.21.tar.gz

rm -rf which-2.21
tar xf which-2.21.tar.gz
pushd which-2.21

./configure --prefix=/usr --enable-static
make

make install

#cat > /usr/bin/which << "EOF"
##!/bin/bash
#type -pa "$@" | head -n 1 ; exit ${PIPESTATUS[0]}
#EOF
#chmod -v 755 /usr/bin/which
#chown -v root:root /usr/bin/which

popd
rm -rf which-2.21
