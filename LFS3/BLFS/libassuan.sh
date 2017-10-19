set -eo nounset

cd /sources

test -f libassuan-2.4.3.tar.bz2 || \
wget --no-check-certificate \
	 https://www.gnupg.org/ftp/gcrypt/libassuan/libassuan-2.4.3.tar.bz2

rm -rf libassuan-2.4.3
tar xf libassuan-2.4.3.tar.bz2
pushd  libassuan-2.4.3

./configure --prefix=/usr &&
make

if which texlive ; then
make -C doc pdf ps
fi

make install

if which texlive ; then
install -v -dm755 /usr/share/doc/libassuan-2.4.3 &&
install -v -m644  doc/assuan.{pdf,ps,dvi} \
                  /usr/share/doc/libassuan-2.4.3
fi

popd
rm -rf libassuan-2.4.3
