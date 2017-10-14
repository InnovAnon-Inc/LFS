set -eo nounset

cd /sources

test -f subversion-1.9.7.tar.bz2 || \
wget --no-check-certificate \
	 https://archive.apache.org/dist/subversion/subversion-1.9.7.tar.bz2

rm -rf subversion-1.9.7
tar xf subversion-1.9.7.tar.bz2
pushd  subversion-1.9.7

./configure --prefix=/usr    \
            --disable-static \
            --with-apache-libexecdir
make

#make javahl

make swig-pl # for Perl
make swig-py \
     swig_pydir=/usr/lib/python2.7/site-packages/libsvn \
     swig_pydir_extra=/usr/lib/python2.7/site-packages/svn # for Python
make swig-rb # for Ruby

make install

install -v -m755 -d /usr/share/doc/subversion-1.9.7
cp      -v -R       doc/* \
                    /usr/share/doc/subversion-1.9.7

#make install-javahl

make install-swig-pl
make install-swig-py \
      swig_pydir=/usr/lib/python2.7/site-packages/libsvn \
      swig_pydir_extra=/usr/lib/python2.7/site-packages/svn
make install-swig-rb

popd
rm -rf subversion-1.9.7

