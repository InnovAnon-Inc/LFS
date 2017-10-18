set -eo nounset

cd /sources

test -f cdrtools-3.02a07.tar.bz2 || \
wget --no-check-certificate \
	https://downloads.sourceforge.net/cdrtools/cdrtools-3.02a07.tar.bz2

rm -rf cdrtools-3.02a07
tar xf cdrtools-3.02a07.tar.bz2
pushd  cdrtools-3.02a07

export GMAKE_NOWARN=true &&
make INS_BASE=/usr DEFINSUSR=root DEFINSGRP=root

export GMAKE_NOWARN=true &&
make INS_BASE=/usr DEFINSUSR=root DEFINSGRP=root install &&
install -v -m755 -d /usr/share/doc/cdrtools-3.02a07 &&
install -v -m644 README* ABOUT doc/*.ps \
                    /usr/share/doc/cdrtools-3.02a07

popd
rm -rf cdrtools-3.02a07
