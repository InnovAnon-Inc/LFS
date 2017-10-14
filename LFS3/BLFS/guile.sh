set -eo nounset

cd /sources

test -f guile-2.2.2.tar.xz || \
wget --no-check-certificate \
	https://ftp.gnu.org/gnu/guile/guile-2.2.2.tar.xz

rm -rf guile-2.2.2
tar xf guile-2.2.2.tar.xz
pushd  guile-2.2.2

./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/guile-2.2.2
make
make html

makeinfo --plaintext -o doc/r5rs/r5rs.txt doc/r5rs/r5rs.texi
makeinfo --plaintext -o doc/ref/guile.txt doc/ref/guile.texi

make install
make install-html

mv /usr/lib/libguile-*-gdb.scm /usr/share/gdb/auto-load/usr/lib
mv /usr/share/doc/guile-2.2.2/{guile.html,ref}
mv /usr/share/doc/guile-2.2.2/r5rs{.html,}

find examples -name "Makefile*" -delete
cp -vR examples   /usr/share/doc/guile-2.2.2

for DIRNAME in r5rs ref; do
  install -v -m644  doc/${DIRNAME}/*.txt \
                    /usr/share/doc/guile-2.2.2/${DIRNAME}
done
unset DIRNAME

popd
rm -rf guile-2.2.2

