set -eo nounset

cd /sources

test -f swig-3.0.12.tar.gz || \
wget --no-check-certificate \
	http://downloads.sourceforge.net/swig/swig-3.0.12.tar.gz

rm -rf swig-3.0.12
tar xf swig-3.0.12.tar.gz
pushd  swig-3.0.12

sed -i 's/\$(PERL5_SCRIPT/-I. &/' Examples/Makefile.in
sed -i 's/\$command 2/-I. &/' Examples/test-suite/perl5/run-perl-test.pl

./configure --prefix=/usr                      \
            --without-clisp                    \
            --without-maximum-compile-warnings
make

make install
install -v -m755 -d /usr/share/doc/swig-3.0.12
cp -v -R Doc/* /usr/share/doc/swig-3.0.12

popd
rm -rf swig-3.0.12
