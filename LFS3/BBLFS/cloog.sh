set -eo nounset

cd /other-repos || cd /repos

if [ -d cloog ] ; then
	pushd cloog
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone git://repo.or.cz/cloog.git
fi

cd cloog

#./get_submodules.sh
./autogen.sh
./configure --prefix=/usr
make
make install
