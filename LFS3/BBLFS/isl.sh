set -eo nounset

cd /other-repos || cd /repos

if [ -d isl ] ; then
	pushd isl
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone git://repo.or.cz/isl.git
fi

cd isl

#./get_submodules.sh
./autogen.sh
./configure --prefix=/usr
make
make install
