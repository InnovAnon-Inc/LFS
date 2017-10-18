set -eo nounset

cd /sources

test -f gutenprint-5.2.13.tar.bz2 || \
wget --no-check-certificate \
	https://downloads.sourceforge.net/gimp-print/gutenprint-5.2.13.tar.bz2

rm -rf gutenprint-5.2.13
tar xf gutenprint-5.2.13.tar.bz2
pushd  gutenprint-5.2.13

# For the Sinfonia S6145 and the Ciaat Brava 21, libS6145ImageReProcess, see Peachy Photos (Sinfonia) for instructions on how to build and test this.

# For the Mitsubishi D70 family and the similar Kodak 305, libMitsuD70ImageReProcess, see Peachy Photos (Mitsubishi CP-D70) for instructions on how to build and test this. 

sed -i 's|$(PACKAGE)/doc|doc/$(PACKAGE)-$(VERSION)|' \
       {,doc/,doc/developer/}Makefile.in &&

./configure --prefix=/usr --disable-static &&

make

make install &&
install -v -m755 -d /usr/share/doc/gutenprint-5.2.13/api/gutenprint{,ui2} &&
install -v -m644    doc/gutenprint/html/* \
                    /usr/share/doc/gutenprint-5.2.13/api/gutenprint &&
install -v -m644    doc/gutenprintui2/html/* \
                    /usr/share/doc/gutenprint-5.2.13/api/gutenprintui2

/etc/rc.d/init.d/cups restart

# TODO
#http://localhost:631/

popd
rm -rf gutenprint-5.2.13
