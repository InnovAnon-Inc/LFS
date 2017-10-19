set -eo nounset

cd /other-repos || cd /repos

if [ -d perl ] ; then
	pushd perl
	git reset --hard
	git clean -d -f -x
	git checkout maint-5.26
	git pull origin maint-5.26
	popd
else
	git clone git://perl5.git.perl.org/perl.git
	git checkout maint-5.26
fi

cd perl

export BUILD_ZLIB=False
export BUILD_BZIP2=0

sh Configure -des -Dprefix=/usr                 \
                  -Dvendorprefix=/usr           \
                  -Dman1dir=/usr/share/man/man1 \
                  -Dman3dir=/usr/share/man/man3 \
                  -Dpager="/usr/bin/less -isR"  \
                  -Duseshrplib                  \
                  -Dusethreads

make

#make -k test

make install
unset BUILD_ZLIB BUILD_BZIP
