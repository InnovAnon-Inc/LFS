set -eo nounset

cd /sources

test -f asymptote-2.41.src.tgz || \
wget --no-check-certificate \
	http://downloads.sourceforge.net/asymptote/asymptote-2.41.src.tgz

rm -rf asymptote-2.41
tar xf asymptote-2.41.src.tgz
pushd  asymptote-2.41

export TEXARCH=$(uname -m | sed -e 's/i.86/i386/' -e 's/$/-linux/')

./configure --prefix=/opt/texlive/2017                          \
            --bindir=/opt/texlive/2017/bin/$TEXARCH             \
            --datarootdir=/opt/texlive/2017/texmf-dist          \
            --infodir=/opt/texlive/2017/texmf-dist/doc/info     \
            --libdir=/opt/texlive/2017/texmf-dist               \
            --mandir=/opt/texlive/2017/texmf-dist/doc/man       \
            --enable-gc=system                                  \
            --with-latex=/opt/texlive/2017/texmf-dist/tex/latex \
            --with-context=/opt/texlive/2017/texmf-dist/tex/context/third

make

make install
rm -fv /opt/texlive/2017/texmf-dist/doc/info/asymptote.info

popd
rm -rf asymptote-2.41

