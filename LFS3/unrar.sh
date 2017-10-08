cd /sources

test -f unrarsrc-5.5.8.tar.gz || \
wget --no-check-certificate \
	http://www.rarlab.com/rar/unrarsrc-5.5.8.tar.gz

rm -rf unrar/
tar xf unrarsrc-5.5.8.tar.gz
cd unrar/

make -f makefile

install -v -m755 unrar /usr/bin

