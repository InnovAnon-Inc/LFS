set -eo nounset

cd /sources

test -f terminus-font-4.46.tar.gz || \
wget --no-check-certificate \
	http://downloads.sourceforge.net/project/terminus-font/terminus-font-4.46/terminus-font-4.46.tar.gz

rm -rf terminus-font-4.46
tar xf terminus-font-4.46.tar.gz
pushd  terminus-font-4.46

./configure
#make
make psf
#make install fontdir
gzip ter-v32n.psf
install -v -m644 ter-v32n.psf.gz /usr/share/consolefonts

rm -rf terminus-font-4.46
