set -eo nounset

cd /other-repos || cd /repos

if [ -d gnulib ] ; then
	pushd gnulib
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://git.savannah.gnu.org/git/gnulib.git
fi

cd gnulib

#make info html dvi pdf
make info
#make install
rm -f /usr/bin/gnulib-tool
ln -vs `pwd`/gnulib-tool /usr/bin/gnulib-tool

